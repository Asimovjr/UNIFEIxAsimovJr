import 'package:flutter/material.dart';

import 'gallery_screen.dart';
import 'ui/core/shared/themes/unifei_theme.dart';

/// Ponto de entrada da galeria de widgets: `flutter run -t lib/main_gallery.dart`.
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: UnifeiTheme.light,
      home: const GalleryScreen(),
    ),
  );
}
