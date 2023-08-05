import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PoppinsTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      textTheme: GoogleFonts.poppinsTextTheme(
        Typography().englishLike,
      ),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
          .copyWith(secondary: Colors.green),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      primaryColor: Colors.blue,
      textTheme: GoogleFonts.poppinsTextTheme(
        Typography().englishLike,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.green),
    );
  }
}

const TextStyle headingTextStyle = TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.2,
  color: Colors.black,
);

const TextStyle subheadingTextStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w600,
  letterSpacing: 1.0,
  color: Colors.black,
);

const TextStyle bodyTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
  letterSpacing: 0.5,
  color: Colors.black,
);

const TextStyle captionTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.normal,
  letterSpacing: 0.2,
  color: Colors.black,
);

const TextStyle labelTextStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.bold,
  letterSpacing: 0.8,
  color: Colors.black,
);
