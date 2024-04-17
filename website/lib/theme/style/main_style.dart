import 'package:flutter/material.dart';

class MainTheme {
  static final theme = ThemeData.from(
    colorScheme: const ColorScheme.dark(),
    textTheme: MainTextTheme.main,
    useMaterial3: true,
  );
}

class MainTextTheme {
  static final main = Typography.englishLike2021.copyWith(
    displayLarge: _display,
    displayMedium: _display,
    displaySmall: _display,
    headlineLarge: _headline,
    headlineMedium: _headline,
    headlineSmall: _headline,
    titleLarge: _title,
    titleMedium: _title,
    titleSmall: _title,
    labelLarge: _label,
    labelMedium: _label,
    labelSmall: _label,
    bodyLarge: _body,
    bodyMedium: _body,
    bodySmall: _body,
  );

  static const _display =
      TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.w700);

  static const _headline =
      TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.w700);

  static const _title = TextStyle(
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w600,
  );

  static const _label = TextStyle(
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w600,
  );

  static final _body = TextStyle(
    fontFamily: 'OpenSans',
    color: Colors.white.withOpacity(0.666),
  );
}
