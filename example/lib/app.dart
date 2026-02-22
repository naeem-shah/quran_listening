import 'package:flutter/material.dart';
import 'package:mawaqit_mobile_i18n/gen_l10n/app_localizations.dart';
import 'package:mawaqit_quran_listening/mawaqit_quran_listening.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'l10n.dart';
import 'pages/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// Main app widget that sets up providers and theme
class QuranListeningExampleApp extends StatelessWidget {
  const QuranListeningExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Sizer(
          builder: (context, orientation, deviceType) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => RecitorsProvider(
                    QuranListeningRepository(QuranListeningConfig.hiveManager),
                  ),
                ),
                ChangeNotifierProvider(
                  create: (context) => ListeningToggleIndexProvider(),
                ),
                ChangeNotifierProvider(
                  create: (context) => AudioPlayerProvider(),
                ),
                ChangeNotifierProvider(
                  create: (context) => DownloadController(reciterId: ''),
                ),
                ChangeNotifierProvider(
                  create: (context) => FavoriteReciter(),
                ),
                ChangeNotifierProvider(
                  create: (context) => FavoriteSurah(),
                ),
                ChangeNotifierProvider(
                  create: (context) => RecitationsManager(),
                ),
                ChangeNotifierProvider(
                  create: (context) => PlayerScreensController(),
                ),
                ChangeNotifierProvider(
                  create: (context) => NavigationControllerV3(),
                ),
                ChangeNotifierProvider(
                  create: (context) => DownloadedPagePlayPauseIndexProvider(),
                ),
              ],
              child: MaterialApp(
                title: 'Quran Listening Example',
                debugShowCheckedModeBanner: false,
                locale: Locale('en'),
                theme: buildLightTheme(),
                darkTheme: buildDarkTheme(),
                supportedLocales: const [
                  Locale('en', ''),
                  Locale('ar', ''),
                  Locale('fr', ''),
                ],
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  FallbackMaterialLocalizationsDelegate(),
                  FallbackCupertinoLocalizationsDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                themeMode: ThemeMode.system,
                home: const HomePage(),
              ),
            );
          }
        );
      }
    );
  }
}


const primary = Color(0xFF534741);
const secondary = Color(0xFF6F8A5E);

ThemeData buildLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF4F1EC),

    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: primary,
      onPrimary: Colors.white,
      secondary: secondary,
      onSecondary: Colors.white,
      error: Color(0xFFD64545),
      onError: Colors.white,
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF2E2A28),
      outline: Color(0xFFDDD6CC),
      surfaceContainerHighest: Color(0xFFECE6DD),

    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),

    textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(secondary),
      ),
    ),

    dividerColor: const Color(0xFFDDD6CC),
  );
}

ThemeData buildDarkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF161412),

    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: primary,
      onPrimary: Colors.white,
      secondary: secondary,
      onSecondary: Colors.white,
      error: Color(0xFFD64545),
      onError: Colors.white,
      surface: Color(0xFF1E1B18),
      onSurface: Color(0xFFEDE8E2),
      outline: Color(0xFF2F2A27),
      surfaceContainerHighest: Color(0xFF2A2623),

    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1B18),
      foregroundColor: Color(0xFFEDE8E2),
      elevation: 0,
    ),

    dividerColor: const Color(0xFF2F2A27),
  );
}

