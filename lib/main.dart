import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/configuration/styles.dart';
import 'core/routing/route_path.dart';
import 'core/routing/router.dart';
import 'injection_container.dart';

void main() {
  initInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1080, 1920),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Styles.colorPrimary, brightness: Brightness.dark),
            useMaterial3: true,
            iconTheme: IconThemeData(color: Colors.white),
            appBarTheme: AppBarTheme(backgroundColor: Styles.backgroundColor),
            //scaffoldBackgroundColor: Styles.backgroundColor,
            inputDecorationTheme: Styles.inputDecorationStyle.copyWith(
                fillColor: Colors.transparent,
                labelStyle: TextStyle(color: Colors.black)),
            textTheme: TextTheme(
              titleMedium: TextStyle(color: Colors.black),
            )),
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('ar', 'AE'), // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          appBarTheme: AppBarTheme(
            backgroundColor: Styles.colorPrimary,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
            iconTheme: IconThemeData(color: Colors.white),
          ),
          scaffoldBackgroundColor: Color(0XFFF2F2F2),
          useMaterial3: true,
        ),
        scrollBehavior: ScrollConfiguration.of(context).copyWith(
          physics: const BouncingScrollPhysics(),
        ),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: RoutePaths.SplashScreen,
      ),
    );
  }
}
