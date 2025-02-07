import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff904a47),
      surfaceTint: Color(0xff904a47),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdad7),
      onPrimaryContainer: Color(0xff733331),
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
      surface: Color(0xfff8faf0),
      onSurface: Color(0xff191d16),
      onSurfaceVariant: Color(0xff3f484a),
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
      surfaceDim: Color(0xffd9dbd1),
      surfaceBright: Color(0xfff8faf0),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f5ea),
      surfaceContainer: Color(0xffedefe5),
      surfaceContainerHigh: Color(0xffe7e9df),
      surfaceContainerHighest: Color(0xffe1e4d9),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff5e2321),
      surfaceTint: Color(0xff904a47),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa15854),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff453400),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff85691c),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff5c260a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff9f5b3b),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff8faf0),
      onSurface: Color(0xff0f120c),
      onSurfaceVariant: Color(0xff2f3839),
      outline: Color(0xff4b5456),
      outlineVariant: Color(0xff656f70),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e312b),
      inversePrimary: Color(0xffffb3ae),
      primaryFixed: Color(0xffa15854),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff84413e),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff85691c),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff6a5100),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff9f5b3b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff824426),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc5c8be),
      surfaceBright: Color(0xfff8faf0),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f5ea),
      surfaceContainer: Color(0xffe7e9df),
      surfaceContainerHigh: Color(0xffdbded4),
      surfaceContainerHighest: Color(0xffd0d3c9),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff511918),
      surfaceTint: Color(0xff904a47),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff763633),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff392a00),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff5c4600),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff4f1d02),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff74391b),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff8faf0),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff252e2f),
      outlineVariant: Color(0xff414b4c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e312b),
      inversePrimary: Color(0xffffb3ae),
      primaryFixed: Color(0xff763633),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff59201e),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff5c4600),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff413000),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff74391b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff572307),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb7bab0),
      surfaceBright: Color(0xfff8faf0),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff2e7),
      surfaceContainer: Color(0xffe1e4d9),
      surfaceContainerHigh: Color(0xffd3d5cc),
      surfaceContainerHighest: Color(0xffc5c8be),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb3ae),
      surfaceTint: Color(0xffffb3ae),
      onPrimary: Color(0xff571d1c),
      primaryContainer: Color(0xff733331),
      onPrimaryContainer: Color(0xffffdad7),
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
      surface: Color(0xff11140f),
      onSurface: Color(0xffe1e4d9),
      onSurfaceVariant: Color(0xffbfc8ca),
      outline: Color(0xff899294),
      outlineVariant: Color(0xff3f484a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
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
      surfaceContainerLowest: Color(0xff0c0f0a),
      surfaceContainerLow: Color(0xff191d16),
      surfaceContainer: Color(0xff1d211a),
      surfaceContainerHigh: Color(0xff282b24),
      surfaceContainerHighest: Color(0xff32362f),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd2ce),
      surfaceTint: Color(0xffffb3ae),
      onPrimary: Color(0xff481312),
      primaryContainer: Color(0xffcb7b76),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffdd87f),
      onSecondary: Color(0xff312400),
      secondaryContainer: Color(0xffac8d3d),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffd3c1),
      onTertiary: Color(0xff461700),
      tertiaryContainer: Color(0xffc97e5b),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff11140f),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd4dee0),
      outline: Color(0xffaab4b5),
      outlineVariant: Color(0xff889294),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e4d9),
      inversePrimary: Color(0xff743432),
      primaryFixed: Color(0xffffdad7),
      onPrimaryFixed: Color(0xff2c0103),
      primaryFixedDim: Color(0xffffb3ae),
      onPrimaryFixedVariant: Color(0xff5e2321),
      secondaryFixed: Color(0xffffdf95),
      onSecondaryFixed: Color(0xff181000),
      secondaryFixedDim: Color(0xffe6c36c),
      onSecondaryFixedVariant: Color(0xff453400),
      tertiaryFixed: Color(0xffffdbcc),
      onTertiaryFixed: Color(0xff240800),
      tertiaryFixedDim: Color(0xffffb695),
      onTertiaryFixedVariant: Color(0xff5c260a),
      surfaceDim: Color(0xff11140f),
      surfaceBright: Color(0xff42463e),
      surfaceContainerLowest: Color(0xff060804),
      surfaceContainerLow: Color(0xff1b1f18),
      surfaceContainer: Color(0xff252922),
      surfaceContainerHigh: Color(0xff30342d),
      surfaceContainerHighest: Color(0xff3b3f38),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffecea),
      surfaceTint: Color(0xffffb3ae),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffaea8),
      onPrimaryContainer: Color(0xff220001),
      secondary: Color(0xffffeecd),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffe1bf69),
      onSecondaryContainer: Color(0xff110a00),
      tertiary: Color(0xffffece5),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffffb08c),
      onTertiaryContainer: Color(0xff1b0500),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff11140f),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffe8f2f3),
      outlineVariant: Color(0xffbbc4c6),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e4d9),
      inversePrimary: Color(0xff743432),
      primaryFixed: Color(0xffffdad7),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb3ae),
      onPrimaryFixedVariant: Color(0xff2c0103),
      secondaryFixed: Color(0xffffdf95),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffe6c36c),
      onSecondaryFixedVariant: Color(0xff181000),
      tertiaryFixed: Color(0xffffdbcc),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffffb695),
      onTertiaryFixedVariant: Color(0xff240800),
      surfaceDim: Color(0xff11140f),
      surfaceBright: Color(0xff4e514a),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1d211a),
      surfaceContainer: Color(0xff2e312b),
      surfaceContainerHigh: Color(0xff393c35),
      surfaceContainerHighest: Color(0xff444840),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
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
