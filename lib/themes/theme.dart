import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4284634768),
      surfaceTint: Color(4284634768),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4293385983),
      onPrimaryContainer: Color(4280160328),
      secondary: Color(4278216821),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4288606206),
      onSecondaryContainer: Color(4278198052),
      tertiary: Color(4282411062),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4290834352),
      onTertiaryContainer: Color(4278198784),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294834431),
      onSurface: Color(4280032032),
      onSurfaceVariant: Color(4283123021),
      outline: Color(4286346622),
      outlineVariant: Color(4291675342),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413430),
      inversePrimary: Color(4291608063),
      primaryFixed: Color(4293385983),
      onPrimaryFixed: Color(4280160328),
      primaryFixedDim: Color(4291608063),
      onPrimaryFixedVariant: Color(4283055734),
      secondaryFixed: Color(4288606206),
      onSecondaryFixed: Color(4278198052),
      secondaryFixedDim: Color(4286764001),
      onSecondaryFixedVariant: Color(4278210392),
      tertiaryFixed: Color(4290834352),
      onTertiaryFixed: Color(4278198784),
      tertiaryFixedDim: Color(4289057685),
      onTertiaryFixedVariant: Color(4280832032),
      surfaceDim: Color(4292729056),
      surfaceBright: Color(4294834431),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294439674),
      surfaceContainer: Color(4294044916),
      surfaceContainerHigh: Color(4293650158),
      surfaceContainerHighest: Color(4293321193),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4282792562),
      surfaceTint: Color(4284634768),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4286147752),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278209108),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4280647565),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280568605),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283793226),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294834431),
      onSurface: Color(4280032032),
      onSurfaceVariant: Color(4282859849),
      outline: Color(4284702054),
      outlineVariant: Color(4286609538),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413430),
      inversePrimary: Color(4291608063),
      primaryFixed: Color(4286147752),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4284502925),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4280647565),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4278216306),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283793226),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282213939),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292729056),
      surfaceBright: Color(4294834431),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294439674),
      surfaceContainer: Color(4294044916),
      surfaceContainerHigh: Color(4293650158),
      surfaceContainerHighest: Color(4293321193),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4280621135),
      surfaceTint: Color(4284634768),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4282792562),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278200108),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4278209108),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278331649),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4280568605),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294834431),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280754730),
      outline: Color(4282859849),
      outlineVariant: Color(4282859849),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413430),
      inversePrimary: Color(4293978623),
      primaryFixed: Color(4282792562),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4281344858),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4278209108),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4278202937),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4280568605),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4279055368),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292729056),
      surfaceBright: Color(4294834431),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294439674),
      surfaceContainer: Color(4294044916),
      surfaceContainerHigh: Color(4293650158),
      surfaceContainerHighest: Color(4293321193),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4291608063),
      surfaceTint: Color(4291608063),
      onPrimary: Color(4281542494),
      primaryContainer: Color(4283055734),
      onPrimaryContainer: Color(4293385983),
      secondary: Color(4286764001),
      onSecondary: Color(4278203965),
      secondaryContainer: Color(4278210392),
      onSecondaryContainer: Color(4288606206),
      tertiary: Color(4289057685),
      onTertiary: Color(4279318539),
      tertiaryContainer: Color(4280832032),
      onTertiaryContainer: Color(4290834352),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279505688),
      onSurface: Color(4293321193),
      onSurfaceVariant: Color(4291675342),
      outline: Color(4288056984),
      outlineVariant: Color(4283123021),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293321193),
      inversePrimary: Color(4284634768),
      primaryFixed: Color(4293385983),
      onPrimaryFixed: Color(4280160328),
      primaryFixedDim: Color(4291608063),
      onPrimaryFixedVariant: Color(4283055734),
      secondaryFixed: Color(4288606206),
      onSecondaryFixed: Color(4278198052),
      secondaryFixedDim: Color(4286764001),
      onSecondaryFixedVariant: Color(4278210392),
      tertiaryFixed: Color(4290834352),
      onTertiaryFixed: Color(4278198784),
      tertiaryFixedDim: Color(4289057685),
      onTertiaryFixedVariant: Color(4280832032),
      surfaceDim: Color(4279505688),
      surfaceBright: Color(4282005566),
      surfaceContainerLowest: Color(4279176467),
      surfaceContainerLow: Color(4280032032),
      surfaceContainer: Color(4280295205),
      surfaceContainerHigh: Color(4281018671),
      surfaceContainerHighest: Color(4281742394),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4291871487),
      surfaceTint: Color(4291608063),
      onPrimary: Color(4279831107),
      primaryContainer: Color(4288055494),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4287027174),
      onSecondary: Color(4278196766),
      secondaryContainer: Color(4283014314),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4289320857),
      onTertiary: Color(4278197248),
      tertiaryContainer: Color(4285635684),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279505688),
      onSurface: Color(4294900223),
      onSurfaceVariant: Color(4291938515),
      outline: Color(4289241258),
      outlineVariant: Color(4287136138),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293321193),
      inversePrimary: Color(4283121527),
      primaryFixed: Color(4293385983),
      onPrimaryFixed: Color(4279436094),
      primaryFixedDim: Color(4291608063),
      onPrimaryFixedVariant: Color(4281937252),
      secondaryFixed: Color(4288606206),
      onSecondaryFixed: Color(4278195224),
      secondaryFixedDim: Color(4286764001),
      onSecondaryFixedVariant: Color(4278205508),
      tertiaryFixed: Color(4290834352),
      onTertiaryFixed: Color(4278195712),
      tertiaryFixedDim: Color(4289057685),
      onTertiaryFixedVariant: Color(4279713297),
      surfaceDim: Color(4279505688),
      surfaceBright: Color(4282005566),
      surfaceContainerLowest: Color(4279176467),
      surfaceContainerLow: Color(4280032032),
      surfaceContainer: Color(4280295205),
      surfaceContainerHigh: Color(4281018671),
      surfaceContainerHighest: Color(4281742394),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294900223),
      surfaceTint: Color(4291608063),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4291871487),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294114815),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4287027174),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294115303),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4289320857),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279505688),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294965755),
      outline: Color(4291938515),
      outlineVariant: Color(4291938515),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293321193),
      inversePrimary: Color(4281147735),
      primaryFixed: Color(4293649407),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4291871487),
      onPrimaryFixedVariant: Color(4279831107),
      secondaryFixed: Color(4289590015),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4287027174),
      onSecondaryFixedVariant: Color(4278196766),
      tertiaryFixed: Color(4291163316),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4289320857),
      onTertiaryFixedVariant: Color(4278197248),
      surfaceDim: Color(4279505688),
      surfaceBright: Color(4282005566),
      surfaceContainerLowest: Color(4279176467),
      surfaceContainerLow: Color(4280032032),
      surfaceContainer: Color(4280295205),
      surfaceContainerHigh: Color(4281018671),
      surfaceContainerHighest: Color(4281742394),
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
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  /// Custom Color 1
  static const customColor1 = ExtendedColor(
    seed: Color(4294625536),
    value: Color(4294625536),
    light: ColorFamily(
      color: Color(4285684748),
      onColor: Color(4294967295),
      colorContainer: Color(4294959240),
      onColorContainer: Color(4280556032),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(4285684748),
      onColor: Color(4294967295),
      colorContainer: Color(4294959240),
      onColorContainer: Color(4280556032),
    ),
    lightHighContrast: ColorFamily(
      color: Color(4285684748),
      onColor: Color(4294967295),
      colorContainer: Color(4294959240),
      onColorContainer: Color(4280556032),
    ),
    dark: ColorFamily(
      color: Color(4293051501),
      onColor: Color(4282134272),
      colorContainer: Color(4283909376),
      onColorContainer: Color(4294959240),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(4293051501),
      onColor: Color(4282134272),
      colorContainer: Color(4283909376),
      onColorContainer: Color(4294959240),
    ),
    darkHighContrast: ColorFamily(
      color: Color(4293051501),
      onColor: Color(4282134272),
      colorContainer: Color(4283909376),
      onColorContainer: Color(4294959240),
    ),
  );

  List<ExtendedColor> get extendedColors => [
        customColor1,
      ];
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
