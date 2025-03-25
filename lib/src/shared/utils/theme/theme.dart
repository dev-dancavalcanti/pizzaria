import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromARGB(255, 0, 0, 0), // Text
      surfaceTint: Color(0xff904a47),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color.fromARGB(255, 0, 0, 0), // FloatingBotton
      onPrimaryContainer: Color(0xFFFCFCFC), // Icon FloatingBotton
      secondary: Color(0xff755b0b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffdf95),
      onSecondaryContainer: Color(0xff594400),
      tertiary: Color(0xff8e4d2e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffdbcc),
      onTertiaryContainer: Color(0xff713619),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color.fromARGB(255, 226, 229, 231), // Background
      onSurface: Color.fromARGB(255, 0, 0, 0), //Text Card
      onSurfaceVariant: Color.fromARGB(255, 0, 0, 0), //Text Search, Icon Search
      outline: Color(0xff6f797a),
      outlineVariant: Color(0xffbfc8ca),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e312b),
      inversePrimary: Color(0xffffb3ae),
      primaryFixed: Color(0xffffdad7),
      onPrimaryFixed: Color(0xff3b0809),
      primaryFixedDim: Color(0xffffb3ae),
      onPrimaryFixedVariant: Color(0xff733331),
      secondaryFixed: Color(0xffffdf95),
      onSecondaryFixed: Color(0xff251a00),
      secondaryFixedDim: Color(0xffe6c36c),
      onSecondaryFixedVariant: Color(0xff594400),
      tertiaryFixed: Color(0xffffdbcc),
      onTertiaryFixed: Color(0xff351000),
      tertiaryFixedDim: Color(0xffffb695),
      onTertiaryFixedVariant: Color(0xff713619),
      surfaceDim: Color.fromARGB(255, 0, 0, 0),
      surfaceBright: Color.fromARGB(255, 0, 0, 0),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xFFFFFFFF),
      surfaceContainer: Color.fromARGB(255, 0, 0, 0),
      surfaceContainerHigh: Color(0xFFFFFFFF),
      surfaceContainerHighest: Color.fromARGB(255, 0, 0, 0),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromARGB(255, 255, 255, 255),
      surfaceTint: Color.fromARGB(255, 211, 14, 0),
      onPrimary: Color.fromARGB(255, 94, 81, 81),
      primaryContainer: Color.fromARGB(
          255, 255, 255, 255), // [FloatingButton, CircularAvatar]
      onPrimaryContainer: Color.fromARGB(255, 114, 48, 43),
      secondary: Color(0xffe6c36c),
      onSecondary: Color(0xff3e2e00),
      secondaryContainer: Color(0xff594400),
      onSecondaryContainer: Color(0xffffdf95),
      tertiary: Color(0xffffb695),
      onTertiary: Color(0xff542105),
      tertiaryContainer: Color(0xff713619),
      onTertiaryContainer: Color(0xffffdbcc),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color.fromARGB(255, 51, 12, 12), // Background Scaffold
      onSurface: Color(0xffe1e4d9),
      onSurfaceVariant: Color(0xffbfc8ca),
      outline: Color(0xff899294),
      outlineVariant: Color(0xff3f484a),
      shadow: Color.fromARGB(255, 82, 58, 58),
      scrim: Color.fromARGB(255, 116, 59, 59),
      inverseSurface: Color(0xffe1e4d9),
      inversePrimary: Color(0xff904a47),
      primaryFixed: Color(0xffffdad7),
      onPrimaryFixed: Color(0xff3b0809),
      primaryFixedDim: Color(0xffffb3ae),
      onPrimaryFixedVariant: Color(0xff733331),
      secondaryFixed: Color(0xffffdf95),
      onSecondaryFixed: Color(0xff251a00),
      secondaryFixedDim: Color(0xffe6c36c),
      onSecondaryFixedVariant: Color(0xff594400),
      tertiaryFixed: Color(0xffffdbcc),
      onTertiaryFixed: Color(0xff351000),
      tertiaryFixedDim: Color(0xffffb695),
      onTertiaryFixedVariant: Color(0xff713619),
      surfaceDim: Color(0xff11140f),
      surfaceBright: Color(0xff373a33),
      surfaceContainerLowest: Color.fromARGB(255, 189, 151, 151),
      surfaceContainerLow: Color(0xFFC14545), // [Card, ElevatedButton]
      surfaceContainer: Color(0xff1d211a),
      surfaceContainerHigh: Color(0xff282b24),
      surfaceContainerHighest: Color(0xff32362f),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
