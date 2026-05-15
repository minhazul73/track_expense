import 'package:track_expense/src/core/imports/core_imports.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final current = _buildMaterialApp(context);
    return ScreenUtilWrapper(child: current);
  }

  Widget _buildMaterialApp(BuildContext context) {
    return MaterialApp.router(
      title: 'track_expense',
      debugShowCheckedModeBanner: false,
      theme: buildLightTheme(primaryColorHex: '#352B84'),
      darkTheme: buildDarkTheme(primaryColorHex: '#352B84'),
      themeMode: ThemeMode.system,
      routerConfig: appRouter,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: (context, child) {
        Widget current = child!;
        current = SkeletonWrapper(child: current);
        current = SessionListenerWrapper(child: current);
        // final scheme = Theme.of(context).colorScheme;
        return Stack(
          children: [
            const Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      // scheme.primary.withValues(alpha: 0.25),
                      // scheme.secondary.withValues(alpha: 0.2),
                      // scheme.tertiary.withValues(alpha: 0.15),
                      // scheme.surface,
                      Color(0xFF0A0A2E), Color(0xFF1A0A3E), Color(0xFF0D1B2A)
                    ],
                  ),
                ),
              ),
            ),
            current,
          ],
        );
          // return current;
      },
    );
  }
}