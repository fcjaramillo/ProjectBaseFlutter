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

class L10n {
  L10n();

  static L10n? _current;

  static L10n get current {
    assert(
      _current != null,
      'No instance of L10n was loaded. Try to initialize the L10n delegate before accessing L10n.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<L10n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = L10n();
      L10n._current = instance;

      return instance;
    });
  }

  static L10n of(BuildContext context) {
    final instance = L10n.maybeOf(context);
    assert(
      instance != null,
      'No instance of L10n present in the widget tree. Did you add L10n.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static L10n? maybeOf(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  /// `This action is not available now, please try later`
  String get gActionNotAvailable {
    return Intl.message(
      'This action is not available now, please try later',
      name: 'gActionNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Character limit exceeded`
  String get gValidatorNameLenghtError {
    return Intl.message(
      'Character limit exceeded',
      name: 'gValidatorNameLenghtError',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get gOther {
    return Intl.message('Other', name: 'gOther', desc: '', args: []);
  }

  /// `Skip`
  String get gSkip {
    return Intl.message('Skip', name: 'gSkip', desc: '', args: []);
  }

  /// `Yes`
  String get gYes {
    return Intl.message('Yes', name: 'gYes', desc: '', args: []);
  }

  /// `No`
  String get gNo {
    return Intl.message('No', name: 'gNo', desc: '', args: []);
  }

  /// `Continue`
  String get gContinue {
    return Intl.message('Continue', name: 'gContinue', desc: '', args: []);
  }

  /// `N/A`
  String get gNotAvailable {
    return Intl.message('N/A', name: 'gNotAvailable', desc: '', args: []);
  }

  /// `No results found`
  String get gNoResultsFound {
    return Intl.message(
      'No results found',
      name: 'gNoResultsFound',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gGallery {
    return Intl.message('Gallery', name: 'gGallery', desc: '', args: []);
  }

  /// `{percentage}%`
  String gPercentage(double percentage) {
    return Intl.message(
      '$percentage%',
      name: 'gPercentage',
      desc: '',
      args: [percentage],
    );
  }

  /// `Something went wrong.`
  String get gSomethingWrong {
    return Intl.message(
      'Something went wrong.',
      name: 'gSomethingWrong',
      desc: '',
      args: [],
    );
  }

  /// `Please click here to retry`
  String get gPleaseClickHereToRetry {
    return Intl.message(
      'Please click here to retry',
      name: 'gPleaseClickHereToRetry',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong. Please click here to retry`
  String get gValidatorErrorTryAgain {
    return Intl.message(
      'Something went wrong. Please click here to retry',
      name: 'gValidatorErrorTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Please click here to retry`
  String get gValidatorClickHere {
    return Intl.message(
      'Please click here to retry',
      name: 'gValidatorClickHere',
      desc: '',
      args: [],
    );
  }

  /// `This field cannot be empty`
  String get gValidatorNotEmptyField {
    return Intl.message(
      'This field cannot be empty',
      name: 'gValidatorNotEmptyField',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email format`
  String get gValidatorEmailError {
    return Intl.message(
      'Invalid email format',
      name: 'gValidatorEmailError',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone format`
  String get gValidatorPhoneError {
    return Intl.message(
      'Invalid phone format',
      name: 'gValidatorPhoneError',
      desc: '',
      args: [],
    );
  }

  /// `Invalid name format`
  String get gValidatorNameError {
    return Intl.message(
      'Invalid name format',
      name: 'gValidatorNameError',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email or member id format`
  String get gValidatorEmailOrIdError {
    return Intl.message(
      'Invalid email or member id format',
      name: 'gValidatorEmailOrIdError',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get gUpdate {
    return Intl.message('Update', name: 'gUpdate', desc: '', args: []);
  }

  /// `+{text}`
  String gPlusCode(String text) {
    return Intl.message('+$text', name: 'gPlusCode', desc: '', args: [text]);
  }

  /// `Recommended`
  String get gRecommended {
    return Intl.message(
      'Recommended',
      name: 'gRecommended',
      desc: '',
      args: [],
    );
  }

  /// `Not matches found`
  String get gNoMatchesFound {
    return Intl.message(
      'Not matches found',
      name: 'gNoMatchesFound',
      desc: '',
      args: [],
    );
  }

  /// `Leave`
  String get gLeave {
    return Intl.message('Leave', name: 'gLeave', desc: '', args: []);
  }

  /// `Stay`
  String get gStay {
    return Intl.message('Stay', name: 'gStay', desc: '', args: []);
  }

  /// `Something went wrong`
  String get gHasOccurredError {
    return Intl.message(
      'Something went wrong',
      name: 'gHasOccurredError',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong. Please try again`
  String get gSomethingWentWrong {
    return Intl.message(
      'Something went wrong. Please try again',
      name: 'gSomethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get gDetails {
    return Intl.message('Details', name: 'gDetails', desc: '', args: []);
  }

  /// `Swipe down to reload`
  String get gSwipeDownReload {
    return Intl.message(
      'Swipe down to reload',
      name: 'gSwipeDownReload',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get gValidatorErrorRequired {
    return Intl.message(
      'This field is required',
      name: 'gValidatorErrorRequired',
      desc: '',
      args: [],
    );
  }

  /// `The email entered is not valid`
  String get gInvalidEmail {
    return Intl.message(
      'The email entered is not valid',
      name: 'gInvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Username or password is incorrect`
  String get gUsernameOrPasswordIncorrect {
    return Intl.message(
      'Username or password is incorrect',
      name: 'gUsernameOrPasswordIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `Show less`
  String get gShowLess {
    return Intl.message('Show less', name: 'gShowLess', desc: '', args: []);
  }

  /// `Show more`
  String get gShowMore {
    return Intl.message('Show more', name: 'gShowMore', desc: '', args: []);
  }

  /// `Fake Name`
  String get gFakeName {
    return Intl.message('Fake Name', name: 'gFakeName', desc: '', args: []);
  }

  /// `Get Example Status:`
  String get sHomeGetStatusDescriptive {
    return Intl.message(
      'Get Example Status:',
      name: 'sHomeGetStatusDescriptive',
      desc: '',
      args: [],
    );
  }

  /// `Number of clicks:`
  String get sHomeNumberClicksDescriptive {
    return Intl.message(
      'Number of clicks:',
      name: 'sHomeNumberClicksDescriptive',
      desc: '',
      args: [],
    );
  }

  /// `You can tap this box.`
  String get sHomeCanTapHere {
    return Intl.message(
      'You can tap this box.',
      name: 'sHomeCanTapHere',
      desc: '',
      args: [],
    );
  }

  /// `Property details show less`
  String get sPropertyDetailsShowLess {
    return Intl.message(
      'Property details show less',
      name: 'sPropertyDetailsShowLess',
      desc: '',
      args: [],
    );
  }

  /// `Property details show more`
  String get sPropertyDetailsShowMore {
    return Intl.message(
      'Property details show more',
      name: 'sPropertyDetailsShowMore',
      desc: '',
      args: [],
    );
  }

  /// `wish list cancel`
  String get sWishListCancel {
    return Intl.message(
      'wish list cancel',
      name: 'sWishListCancel',
      desc: '',
      args: [],
    );
  }

  /// `insert text`
  String get gInserText {
    return Intl.message('insert text', name: 'gInserText', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<L10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<L10n> load(Locale locale) => L10n.load(locale);
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
