import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

/// Ponto de entrada do app.
///
/// O `ProviderScope` guarda o estado de todos os providers do Riverpod, então
/// precisa envolver o app inteiro.
void main() {
  runApp(const ProviderScope(child: App()));
}
