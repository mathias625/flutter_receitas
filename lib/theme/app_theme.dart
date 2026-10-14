import 'package:flutter/material.dart';

class AppTheme {
  static const preto = Color(0xFF111111);
  static const fundoEscuro = Color(0xFF1C1C1C);
  static const superficieEscura = Color(0xFF252525);
  static const bordaEscura = Color(0xFF3A3A3A);

  static const fundo = Color(0xFFF5F5F5);
  static const superficie = Color(0xFFEEEEEE);
  static const card = Colors.white;
  static const borda = Color(0xFFDDDDDD);

  static const texto = Color(0xFF171717);
  static const textoSecundario = Color(0xFF666666);
  static const textoClaro = Color(0xFFCCCCCC);

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: fundo,
      colorScheme: ColorScheme.fromSeed(
        seedColor: preto,
        primary: preto,
        secondary: fundoEscuro,
        surface: card,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: fundo,
        foregroundColor: texto,
        elevation: 0,
        centerTitle: false,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: card,
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: borda),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: preto, width: 1.5),
        ),
        floatingLabelStyle: const TextStyle(color: preto),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: preto,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: card,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
          side: const BorderSide(color: borda),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: preto,
        foregroundColor: Colors.white,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: preto,
      ),
    );
  }
}
