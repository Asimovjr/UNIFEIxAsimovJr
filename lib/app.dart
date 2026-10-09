import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'routing/router.dart';
import 'ui/core/shared/themes/unifei_theme.dart';

/// Widget raiz do app: junta o tema e a navegação.
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'PRG Mobile',
      debugShowCheckedModeBanner: false,
      theme: UnifeiTheme.light,
      routerConfig: router,
    );
  }
}
