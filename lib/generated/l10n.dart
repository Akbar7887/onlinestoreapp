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

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Компанияси`
  String get company {
    return Intl.message(
      'Компанияси',
      name: 'company',
      desc: '',
      args: [],
    );
  }

  /// `Главная`
  String get main {
    return Intl.message(
      'Главная',
      name: 'main',
      desc: '',
      args: [],
    );
  }

  /// `Поиск`
  String get seach {
    return Intl.message(
      'Поиск',
      name: 'seach',
      desc: '',
      args: [],
    );
  }

  /// `Выход`
  String get exit {
    return Intl.message(
      'Выход',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `Искать товары и категорий`
  String get seach_product {
    return Intl.message(
      'Искать товары и категорий',
      name: 'seach_product',
      desc: '',
      args: [],
    );
  }

  /// `Продукты`
  String get product {
    return Intl.message(
      'Продукты',
      name: 'product',
      desc: '',
      args: [],
    );
  }

  /// `сум`
  String get sum {
    return Intl.message(
      'сум',
      name: 'sum',
      desc: '',
      args: [],
    );
  }

  /// `оценка`
  String get mark {
    return Intl.message(
      'оценка',
      name: 'mark',
      desc: '',
      args: [],
    );
  }

  /// `Описание товара`
  String get description_goods {
    return Intl.message(
      'Описание товара',
      name: 'description_goods',
      desc: '',
      args: [],
    );
  }

  /// `Подробно`
  String get detail {
    return Intl.message(
      'Подробно',
      name: 'detail',
      desc: '',
      args: [],
    );
  }

  /// `цена:`
  String get price {
    return Intl.message(
      'цена:',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Характеристика`
  String get characteristic {
    return Intl.message(
      'Характеристика',
      name: 'characteristic',
      desc: '',
      args: [],
    );
  }

  /// `Желания`
  String get favorite {
    return Intl.message(
      'Желания',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Мои желания`
  String get my_favorite {
    return Intl.message(
      'Мои желания',
      name: 'my_favorite',
      desc: '',
      args: [],
    );
  }

  /// `Корзина`
  String get basket {
    return Intl.message(
      'Корзина',
      name: 'basket',
      desc: '',
      args: [],
    );
  }

  /// `Кол-во`
  String get count {
    return Intl.message(
      'Кол-во',
      name: 'count',
      desc: '',
      args: [],
    );
  }

  /// `Перенести в избранное`
  String get favorite_survive {
    return Intl.message(
      'Перенести в избранное',
      name: 'favorite_survive',
      desc: '',
      args: [],
    );
  }

  /// `Удалить`
  String get delete {
    return Intl.message(
      'Удалить',
      name: 'delete',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
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
