import 'package:flutter/material.dart';

class AppColours {
  static Color get primaryColour {
    return Colors.grey[50];
  }

  static Color get accentColour {
    return Color(0xFF57CC99);
  }

  static Color get primaryTextColour {
    return Color(0xFF707070);
  }

  static Color get secondayTextColour {
    return Color(0xFFFFFFFF);
  }

  static Color get waitingStatusTextColour {
    return Color(0xFFFFA985);
  }

  static Color get completeStatusTextColour {
    return Color(0xFFA9E99B);
  }

  static Color get caravanColour {
    return Colors.brown[500];
  }

  static Color get caravanBackgroundColour {
    return Colors.green[300];
  }
}

class AppStyles {
  static TextStyle get primaryHeadingText {
    return TextStyle(color: AppColours.primaryTextColour, fontSize: 25);
  }

  static TextStyle get primarySubHeadingText {
    return TextStyle(color: AppColours.primaryTextColour, fontSize: 18);
  }

  static TextStyle get primaryText {
    return TextStyle(color: AppColours.primaryTextColour, fontSize: 16);
  }

  static TextStyle get secondaryHeadingText {
    return TextStyle(color: AppColours.secondayTextColour, fontSize: 25);
  }

  static TextStyle get secondarySubHeadingText {
    return TextStyle(color: AppColours.secondayTextColour, fontSize: 18);
  }

  static TextStyle get secondaryText {
    return TextStyle(color: AppColours.secondayTextColour, fontSize: 16);
  }

  static TextStyle get accentHeadingText {
    return TextStyle(color: AppColours.accentColour, fontSize: 25);
  }

  static TextStyle get accentSubHeadingText {
    return TextStyle(color: AppColours.accentColour, fontSize: 18);
  }

  static TextStyle get accentText {
    return TextStyle(color: AppColours.accentColour, fontSize: 16);
  }

  static TextStyle get waitingStatusTextText {
    return TextStyle(color: AppColours.waitingStatusTextColour, fontSize: 12);
  }

  static TextStyle get completeStatusTextText {
    return TextStyle(color: AppColours.completeStatusTextColour, fontSize: 12);
  }
}
