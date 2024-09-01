import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ForgotPassScreenTranslations {
  ForgotPassScreenTranslations(this.locale);

  final Locale locale;

  static ForgotPassScreenTranslations of(BuildContext context) {
    return Localizations.of<ForgotPassScreenTranslations>(
        context, ForgotPassScreenTranslations)!;
  }

  static Future<ForgotPassScreenTranslations> load(Locale locale) async {
    return SynchronousFuture<ForgotPassScreenTranslations>(
        ForgotPassScreenTranslations(locale));
  }

  static const LocalizationsDelegate<ForgotPassScreenTranslations> delegate =
      _ForgotPassScreenTranslationsDelegate();

  String get forgotPasswordTitle {
    return Intl.message(
      'Forget Password',
      name: 'forgotPasswordTitle',
      locale: locale.toString(),
    );
  }

  String get forget {
    return Intl.message(
      'Forget',
      name: 'forget',
      locale: locale.toString(),
    );
  }

  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      locale: locale.toString(),
    );
  }

  String get emailOrMobile {
    return Intl.message(
      'Email or Mobile Number',
      name: 'emailOrMobile',
      locale: locale.toString(),
    );
  }

  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      locale: locale.toString(),
    );
  }
}

class _ForgotPassScreenTranslationsDelegate
    extends LocalizationsDelegate<ForgotPassScreenTranslations> {
  const _ForgotPassScreenTranslationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en'].contains(locale.languageCode);

  @override
  Future<ForgotPassScreenTranslations> load(Locale locale) {
    return ForgotPassScreenTranslations.load(locale);
  }

  @override
  bool shouldReload(_ForgotPassScreenTranslationsDelegate old) => false;
}
