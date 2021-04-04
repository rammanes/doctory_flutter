import 'package:devicelocale/devicelocale.dart';
import 'package:doctory_flutter/Splash/Splash.dart';
import 'package:doctory_flutter/translation/LocaleHelper.dart';

import 'package:flutter/material.dart';
import 'package:doctory_flutter/translation/AppLocalization.dart';
import 'package:doctory_flutter/translation/language_constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  SpecificLocalizationDelegate __appLocalizationsDelegate;
  String currentLanguage;




  @override
  void initState() {
    super.initState();


    getLanguage();
  //  print(currentLanguage);
  //   helper.onLocaleChanged = onLocaleChange;
  //    __appLocalizationsDelegate = SpecificLocalizationDelegate(null);

  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (this._locale == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[800])),
        ),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
      //  title: "Flutter Localization Demo",
        theme: ThemeData(primarySwatch: Colors.blue),
        localizationsDelegates: [
          // SpecificLocalizationDelegate(new Locale('ar')),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          new FallbackCupertinoLocalisationsDelegate(),
          //app-specific localization
          __appLocalizationsDelegate
        ],

        supportedLocales:
        [Locale('en'),
          Locale('ar'),
          Locale('tr'),
          Locale('fr')
        ],



        locale: __appLocalizationsDelegate.overriddenLocale ,
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },

          // localeResolutionCallback: (deviceLocale, supportedLocales) {
          //   _locale = deviceLocale; // here you make your app language similar to device language , but you should check whether the localization is supported by your app
          //   // print("country code: "+_locale.countryCode);
          //   print("device local: " + deviceLocale.languageCode);
          // },
    //    onGenerateRoute: CustomRouter.generatedRoute,
  //      initialRoute: Splash,
        home: Splash(),
      );
    }
  }



  onLocaleChange(Locale locale){
    setState((){
      __appLocalizationsDelegate = new SpecificLocalizationDelegate(locale);
    });
  }

  void getLanguage()async   {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // currentLanguage = prefs.getString("language");

   // String language = Localizations.localeOf(context).languageCode;

    //   currentLanguage = "ar";
    currentLanguage = ui.window.locale.languageCode;


    if(currentLanguage == null){

      helper.onLocaleChanged = onLocaleChange;
      __appLocalizationsDelegate =
          SpecificLocalizationDelegate(Locale("en"));
    }else {
      print(currentLanguage);

      helper.onLocaleChanged = onLocaleChange;
      __appLocalizationsDelegate =
          SpecificLocalizationDelegate(Locale(currentLanguage));
    }

  }
}
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       color: Colors.white,
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//       //  primarySwatch: Colors.blue,
//         backgroundColor: Colors.white,
//       ),
//       home: Splash(),
//     );
//   }
// }

