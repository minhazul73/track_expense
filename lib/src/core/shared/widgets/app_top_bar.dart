import '../../imports/imports.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar({
    super.key,
    required this.title,
    this.titleWidget,
    this.actions,
    this.centerTitle = true,
    this.onPressed,
  });

  final String title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final VoidCallback? onPressed;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    
    // Check if we can pop
    final bool canPop = context.canPop();
    final bool showLeading = onPressed != null || canPop;

    void handleBack() {
      if (onPressed != null) {
        onPressed!();
      } else if (canPop) {
        context.pop();
      }
    }

    return GlassAppBar(
      quality: GlassQuality.premium,
      centerTitle: centerTitle,
      title: titleWidget ??
          Text(
            title,
            style: theme.appBarTheme.titleTextStyle?.copyWith(
              fontWeight: FontWeight.w600,
            ) ?? theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
      leading: showLeading
          ? GestureDetector(
              onTap: handleBack,
              child: ColoredBox(
                color: Colors.transparent,
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedArrowLeft01,
                  size: 24.sp,
                ),
              ),
            )
          : null,
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
