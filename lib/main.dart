import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:tharad/core/logic/helper_methods.dart';
import 'package:tharad/views/auth/otp.dart';
import 'package:tharad/views/auth/register.dart';
import 'package:tharad/views/profile/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterLocalization.instance.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            locale: const Locale('ar', 'EG'), // اللغة العربية - مصر
            supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: ThemeData(
              fontFamily: 'Tajawal',
              appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff434C6D),
                ),
                iconTheme: IconThemeData(color: Color(0xff434C6D)),
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
              ),
              inputDecorationTheme: InputDecorationTheme(
                enabledBorder: buildGreyBorder,
                focusedBorder: buildGreyBorder,
                errorBorder: buildGreyBorder,
                focusedErrorBorder: buildGreyBorder,
              ),
            ),
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            home: ProfileView(),
          );
        },
      ),
    );
  }
}

OutlineInputBorder get buildRedBorder {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: Colors.red, width: 1),
  );
}

OutlineInputBorder get buildGreyBorder {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: Colors.grey, width: 1),
  );
}
