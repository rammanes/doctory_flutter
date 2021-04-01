import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AppLocalization {
  AppLocalization(this.locale);

  final Locale locale;
  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  Map<String, String> _localizedValues;


  Future<void> load() async {
    String jsonStringValues =
    await rootBundle.loadString('lib/translation/lang/${locale.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    _localizedValues =
        mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String translate(String key) {
    return _localizedValues[key];
  }

  // // static member to have simple access to the delegate from Material App
  // static const LocalizationsDelegate<AppLocalization> delegate =
  // _AppLocalizationsDelegate();
}

// class _AppLocalizationsDelegate
//     extends LocalizationsDelegate<AppLocalization> {
//
//   final Locale overriddenLocale;
//
//   _AppLocalizationsDelegate(this.overriddenLocale);
//
//   @override
//   bool isSupported(Locale locale) {
//     return ['en', 'tr', 'ar', 'fr'].contains(locale.languageCode);
//   }
//
//   @override
//   Future<AppLocalization> load(Locale locale) async {
//     AppLocalization localization = new AppLocalization(locale);
//     await localization.load();
//     return localization;
//   }
//
//   @override
//   bool shouldReload(LocalizationsDelegate<AppLocalization> old) => true;
// }

class SpecificLocalizationDelegate
    extends LocalizationsDelegate<AppLocalization> {
  final Locale overriddenLocale;

  SpecificLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => overriddenLocale != null;

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization localization = new AppLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) => true;
}


class FallbackCupertinoLocalisationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalisationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar','tr','fr'].contains(locale.languageCode);

  @override
  Future<CupertinoLocalizations> load(Locale locale) => SynchronousFuture<_DefaultCupertinoLocalizations>(_DefaultCupertinoLocalizations(locale));

  @override
  bool shouldReload(FallbackCupertinoLocalisationsDelegate old) => false;
}

class _DefaultCupertinoLocalizations extends DefaultCupertinoLocalizations {
  final Locale locale;

  _DefaultCupertinoLocalizations(this.locale);
}