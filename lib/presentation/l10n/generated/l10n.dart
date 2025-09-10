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

  /// `Welcome`
  String get gWelcome {
    return Intl.message('Welcome', name: 'gWelcome', desc: '', args: []);
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

  /// `Something wrong`
  String get gSomethingWrong {
    return Intl.message(
      'Something wrong',
      name: 'gSomethingWrong',
      desc: '',
      args: [],
    );
  }

  /// `Please click here to retry.`
  String get gPleaseClickHereToRetry {
    return Intl.message(
      'Please click here to retry.',
      name: 'gPleaseClickHereToRetry',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get gSkip {
    return Intl.message('Skip', name: 'gSkip', desc: '', args: []);
  }

  /// `Continue`
  String get gContinue {
    return Intl.message('Continue', name: 'gContinue', desc: '', args: []);
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
