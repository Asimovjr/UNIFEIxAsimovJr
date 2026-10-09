import 'package:flutter/material.dart';
import 'package:unifei_mobile/ui/core/shared/themes/unifei_colors.dart';
import 'package:unifei_mobile/ui/core/shared/widgets/unifei_bottom_nav_bar.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const labels = ['Início', 'Matérias', 'Carreira', 'Mapa', 'Menu'];

  Widget buildBar({required int currentIndex, ValueChanged<int>? onTap}) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: UnifeiBottomNavBar(
          currentIndex: currentIndex,
          onTap: onTap ?? (_) {},
        ),
      ),
    );
  }

  testWidgets('mostra o rótulo de todos os destinos', (tester) async {
    await tester.pumpWidget(buildBar(currentIndex: 0));

    for (final label in labels) {
      expect(find.text(label), findsOneWidget);
    }
  });

  testWidgets('destaca só o destino ativo', (tester) async {
    await tester.pumpWidget(buildBar(currentIndex: 1));

    Color labelColor(String label) =>
        tester.widget<Text>(find.text(label)).style!.color!;

    expect(labelColor('Matérias'), UnifeiColors.primary);
    expect(labelColor('Início'), UnifeiColors.textSecondary);
  });

  testWidgets('cabe em telas estreitas sem overflow', (tester) async {
    tester.view.physicalSize = const Size(320, 640);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(buildBar(currentIndex: 0));

    expect(tester.takeException(), isNull);
  });

  testWidgets('informa o índice tocado', (tester) async {
    int? tapped;
    await tester.pumpWidget(
      buildBar(currentIndex: 0, onTap: (index) => tapped = index),
    );

    await tester.tap(find.text('Mapa'));

    expect(tapped, 3);
  });
}
