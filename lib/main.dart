import 'package:base/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ui/l10n/generated/l10n.dart';
import 'ui/routes/routes.dart';
import 'ui/theme/theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp(
    title: 'Ui Designs',
    theme: AppTheme.appTheme(
      isDark: false,
      colors: lightThemeColors.appThemeColors(),
    ),
    debugShowCheckedModeBanner: false,
    localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
      L10n.delegate,
      //GlobalMaterialLocalizations.delegate,
      //GlobalWidgetsLocalizations.delegate,
      //GlobalCupertinoLocalizations.delegate,
    ],
    locale: const Locale('en'),
    supportedLocales: L10n.delegate.supportedLocales,
    initialRoute: Routes.kRouteHome,
    onGenerateRoute: AppRouter.generateRoute,
  );
}
