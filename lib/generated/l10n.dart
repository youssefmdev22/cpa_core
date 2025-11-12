// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class CoreLocalizations {
  CoreLocalizations();

  static CoreLocalizations? _current;

  static CoreLocalizations get current {
    assert(_current != null,
        'No instance of CoreLocalizations was loaded. Try to initialize the CoreLocalizations delegate before accessing CoreLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<CoreLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = CoreLocalizations();
      CoreLocalizations._current = instance;

      return instance;
    });
  }

  static CoreLocalizations of(BuildContext context) {
    final instance = CoreLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of CoreLocalizations present in the widget tree. Did you add CoreLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static CoreLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<CoreLocalizations>(context, CoreLocalizations);
  }

  /// `Cpa`
  String get appName {
    return Intl.message(
      'Cpa',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Connection timeout. Please try again later.`
  String get connectionTimeout {
    return Intl.message(
      'Connection timeout. Please try again later.',
      name: 'connectionTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Request timed out. Please try again.`
  String get sendTimeout {
    return Intl.message(
      'Request timed out. Please try again.',
      name: 'sendTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Server took too long to respond.`
  String get receiveTimeout {
    return Intl.message(
      'Server took too long to respond.',
      name: 'receiveTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Bad certificate. Please check your device date/time.`
  String get badCertificate {
    return Intl.message(
      'Bad certificate. Please check your device date/time.',
      name: 'badCertificate',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected error response from server`
  String get badResponse {
    return Intl.message(
      'Unexpected error response from server',
      name: 'badResponse',
      desc: '',
      args: [],
    );
  }

  /// `No response received from server.`
  String get noResponse {
    return Intl.message(
      'No response received from server.',
      name: 'noResponse',
      desc: '',
      args: [],
    );
  }

  /// `Failed to parse error response.`
  String get failedToParseResponse {
    return Intl.message(
      'Failed to parse error response.',
      name: 'failedToParseResponse',
      desc: '',
      args: [],
    );
  }

  /// `Request was cancelled. Please retry.`
  String get dioErrorCancel {
    return Intl.message(
      'Request was cancelled. Please retry.',
      name: 'dioErrorCancel',
      desc: '',
      args: [],
    );
  }

  /// `Network error. Please check your internet connection.`
  String get connectionError {
    return Intl.message(
      'Network error. Please check your internet connection.',
      name: 'connectionError',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred:`
  String get unknownError {
    return Intl.message(
      'An unexpected error occurred:',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get unknown {
    return Intl.message(
      'Unknown',
      name: 'unknown',
      desc: '',
      args: [],
    );
  }

  /// `Location services are disabled.`
  String get locationServicesAreDisabled {
    return Intl.message(
      'Location services are disabled.',
      name: 'locationServicesAreDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Location permission denied.`
  String get locationPermissionDenied {
    return Intl.message(
      'Location permission denied.',
      name: 'locationPermissionDenied',
      desc: '',
      args: [],
    );
  }

  /// `Location permission permanently denied.`
  String get locationPermissionPermanentlyDenied {
    return Intl.message(
      'Location permission permanently denied.',
      name: 'locationPermissionPermanentlyDenied',
      desc: '',
      args: [],
    );
  }

  /// `email is required`
  String get emailIsRequired {
    return Intl.message(
      'email is required',
      name: 'emailIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `enter valid email`
  String get enterValidEmail {
    return Intl.message(
      'enter valid email',
      name: 'enterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `password is required`
  String get passwordIsRequired {
    return Intl.message(
      'password is required',
      name: 'passwordIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `password Not Matched`
  String get passwordNotMatched {
    return Intl.message(
      'password Not Matched',
      name: 'passwordNotMatched',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get thisFieldIsRequired {
    return Intl.message(
      'This field is required',
      name: 'thisFieldIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter valid username`
  String get enterValidUsername {
    return Intl.message(
      'Enter valid username',
      name: 'enterValidUsername',
      desc: '',
      args: [],
    );
  }

  /// `Enter numbers only`
  String get enterNumbersOnly {
    return Intl.message(
      'Enter numbers only',
      name: 'enterNumbersOnly',
      desc: '',
      args: [],
    );
  }

  /// `Enter value must equal 11 digit`
  String get enterValueMustEqual11Digit {
    return Intl.message(
      'Enter value must equal 11 digit',
      name: 'enterValueMustEqual11Digit',
      desc: '',
      args: [],
    );
  }

  /// `Enter valid Egyptian Phone number`
  String get enterValidEgyptianPhoneNumber {
    return Intl.message(
      'Enter valid Egyptian Phone number',
      name: 'enterValidEgyptianPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the address`
  String get pleaseEnterAddress {
    return Intl.message(
      'Please enter the address',
      name: 'pleaseEnterAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Valid Address`
  String get pleaseEnterValidAddress {
    return Intl.message(
      'Please enter Valid Address',
      name: 'pleaseEnterValidAddress',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message(
      'OR',
      name: 'or',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<CoreLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<CoreLocalizations> load(Locale locale) =>
      CoreLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
