import 'package:track_expense/src/core/imports/core_imports.dart';
import 'package:track_expense/src/core/imports/packages_imports.dart';

import '../enums/bottom_nav_tab.dart';
import '../providers/bottom_nav_provider.dart';

class BottomNavPage extends ConsumerStatefulWidget {
  final BottomNavTab initialTab;

  const BottomNavPage({
    super.key,
    this.initialTab = BottomNavTab.home,
  });

  @override
  ConsumerState<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends ConsumerState<BottomNavPage> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    final initial = widget.initialTab;
    _pageController = PageController(initialPage: initial.index);
    final current = ref.read(bottomNavProvider);
    if (current != initial) {
      ref.read(bottomNavProvider.notifier).setTab(initial);
    }
  }

  @override
  void didUpdateWidget(covariant BottomNavPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialTab != widget.initialTab) {
      ref.read(bottomNavProvider.notifier).setTab(widget.initialTab);
      _pageController.jumpToPage(widget.initialTab.index);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<BottomNavTab>(bottomNavProvider, (previous, next) {
      if (!_pageController.hasClients) {
        return;
      }

      final currentPage = (_pageController.page ?? _pageController.initialPage).round();
      if (currentPage == next.index) {
        return;
      }

      _pageController.animateToPage(
        next.index,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
      );
    });

    final currentTab = ref.watch(bottomNavProvider);
    const tabs = BottomNavTab.values;

    return LiquidGlassLayer(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppTopBar(
          title: currentTab.title.tr(),
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            ref.read(bottomNavProvider.notifier).setIndex(index);
          },
          children: tabs.map((tab) => tab.page).toList(),
        ),
        bottomNavigationBar: GlassBottomBar(
          quality: GlassQuality.premium,
                  
          tabs: tabs
              .map(
                (tab) => GlassBottomBarTab(
                  icon: HugeIcon(icon: tab.icon),
                  label: tab.title.tr(),
                ),
              )
              .toList(),
          selectedIndex: currentTab.index,
          onTabSelected: (index) {
            if (index == currentTab.index) {
              return;
            }
      
            ref.read(bottomNavProvider.notifier).setIndex(index);
          },
          extraButton: GlassBottomBarExtraButton(
            icon: const HugeIcon(icon: HugeIcons.strokeRoundedAdd01),
            onTap: () {},
            label: 'bottom_nav.add'.tr(),
          ),
        ),
      ),
    );
  }
}
