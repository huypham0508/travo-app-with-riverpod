import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travo_app/app/routes/app_routes.dart';
import 'package:travo_app/app/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(ProviderScope(
      child: EasyLocalization(
    supportedLocales: const [Locale('en')],
    path: 'assets/translations',
    fallbackLocale: const Locale('en'),
    child: const MyApp(),
  )));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ScreenUtilInit(
        builder: ((context, child) => MaterialApp(
              localizationsDelegates: [
                GlobalCupertinoLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                DefaultCupertinoLocalizations.delegate,
                FlutterI18nDelegate(
                  translationLoader: FileTranslationLoader(
                      basePath: "assets/translations",
                      forcedLocale: const Locale("en")),
                  missingTranslationHandler: (key, locale) {
                    debugPrint(
                      '--- Missing Key: $key, languageCode: ${locale?.languageCode}',
                    );
                  },
                ),
              ],
              title: 'TraVo App',
              theme: ThemeData(
                textTheme: GoogleFonts.rubikTextTheme(textTheme).copyWith(
                  bodyText2: GoogleFonts.rubik(textStyle: textTheme.bodyText2),
                ),
              ),
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              initialRoute: Routes.splash,
              routes: AppRoutes.routes,
            )));
  }
}
