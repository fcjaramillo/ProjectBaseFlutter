import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/supabase/supabase.dart';
import 'ui/l10n/generated/l10n.dart';
import 'ui/routes/routes.dart';
import 'ui/theme/theme.dart';
import 'ui/utils/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Configurar URL strategy para Flutter web
  // Esto permite que las rutas funcionen correctamente al acceder directamente a URLs
  usePathUrlStrategy();

  await SupabaseConfig.initialize();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoRouter router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'William Campino - Payanes de Corazon',
      theme: AppTheme.appTheme(
        isDark: false,
        colors: lightThemeColors.appThemeColors(),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        L10n.delegate,
      ],
      locale: const Locale('es'),
      supportedLocales: L10n.delegate.supportedLocales,
      routerConfig: router,
      builder: (BuildContext context, Widget? child) =>
          ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: <Breakpoint>[
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}
