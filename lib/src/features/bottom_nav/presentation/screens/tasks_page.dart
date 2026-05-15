import 'package:track_expense/src/core/imports/core_imports.dart';
import 'package:track_expense/src/core/imports/packages_imports.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 72, 20, 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),

                // ── Hero card ──────────────────────────────────────────────
                GlassCard(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Liquid Glass',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'iOS 26-inspired glassmorphism for Flutter. '
                        'Shader-based refraction, jelly physics, '
                        'and dynamic lighting on every platform.',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.75),
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Glass icon button
                      GlassButton(
                        icon: const Icon(Icons.play_arrow_rounded),
                        onTap: () {},
                        label: 'Play',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // ── Example list items ─────────────────────────────────────
                for (final item in [
                  (
                    Icons.grid_view_rounded,
                    'Containers',
                    'GlassCard, GlassPanel, GlassContainer'
                  ),
                  (
                    Icons.touch_app_rounded,
                    'Interactive',
                    'GlassButton, GlassSwitch, GlassChip'
                  ),
                  (
                    Icons.layers_rounded,
                    'Surfaces',
                    'GlassBottomBar, GlassAppBar, GlassModalSheet'
                  ),
                ])
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: GlassCard(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Icon(item.$1, color: Colors.white70, size: 28),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.$2,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  item.$3,
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.6),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right,
                              color: Colors.white38),
                        ],
                      ),
                    ),
                  ),
              
                // ── Hero card ──────────────────────────────────────────────
                GlassCard(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Liquid Glass',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'iOS 26-inspired glassmorphism for Flutter. '
                        'Shader-based refraction, jelly physics, '
                        'and dynamic lighting on every platform.',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.75),
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Glass icon button
                      GlassButton(
                        icon: const Icon(Icons.play_arrow_rounded),
                        onTap: () {},
                        label: 'Play',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // ── Example list items ─────────────────────────────────────
                for (final item in [
                  (
                    Icons.grid_view_rounded,
                    'Containers',
                    'GlassCard, GlassPanel, GlassContainer'
                  ),
                  (
                    Icons.touch_app_rounded,
                    'Interactive',
                    'GlassButton, GlassSwitch, GlassChip'
                  ),
                  (
                    Icons.layers_rounded,
                    'Surfaces',
                    'GlassBottomBar, GlassAppBar, GlassModalSheet'
                  ),
                ])
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: GlassCard(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Icon(item.$1, color: Colors.white70, size: 28),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.$2,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  item.$3,
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.6),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right,
                              color: Colors.white38),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
    
    );
  }
}
