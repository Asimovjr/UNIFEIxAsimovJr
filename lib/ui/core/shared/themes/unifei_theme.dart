import 'package:flutter/material.dart';

/// Shared colors from the Figma redesign.
abstract class UnifeiTheme {
  static const Color primary = Color(0xFF003A70);
  static const Color textPrimary = Color(0xFF20343E);
  static const Color textSecondary = Color(0xFF4B647C);
  static const Color textSupporting = Color(0xFF6E8296);
  static const Color blueComplementary = Color(0xFF6D9BC8);
  static const Color blueLight = Color(0xFFE7EFF9);
  static const Color background = Color(0xFFF7F8FA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFDCE3EB);

  // Contextual colors used by subjects, assessments and the calendar.
  static const Color subjectAccent = Color(0xFFE4572E);
  static const Color subjectHeader = Color(0xFFC7401F);
  static const Color assessmentBlue = Color(0xFF2D7DD2);
  static const Color calendarEvent = Color(0xFF7C3AED);
  static const Color calendarHoliday = Color(0xFFC7333C);
  static const Color indicatorGreen = Color(0xFF1E8E5A);
  static const Color indicatorRed = Color(0xFFC8352B);
}
