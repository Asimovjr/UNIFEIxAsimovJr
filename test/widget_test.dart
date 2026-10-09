import 'package:flutter/material.dart';
import 'package:unifei_mobile/app.dart';
import 'package:unifei_mobile/ui/core/shared/themes/unifei_colors.dart';
import 'package:unifei_mobile/ui/core/shared/widgets/unifei_bottom_nav_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<void> pumpApp(WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: App()));
    await tester.pumpAndSettle();
  }

  // Cor do rótulo da barra inferior: azul quando o item está ativo.
  Color navLabelColor(WidgetTester tester, String label) => tester
      .widget<Text>(
        find.descendant(
          of: find.byType(UnifeiBottomNavBar),
          matching: find.text(label),
        ),
      )
      .style!
      .color!;

  testWidgets('abre na aba Início', (tester) async {
    await pumpApp(tester);

    expect(find.text('Abrir Cálculo II'), findsOneWidget);
    expect(navLabelColor(tester, 'Início'), UnifeiColors.primary);
  });

  testWidgets('tocar numa aba troca a tela e o item ativo', (tester) async {
    await pumpApp(tester);

    await tester.tap(find.text('Mapa'));
    await tester.pumpAndSettle();

    expect(find.text('Em construção'), findsOneWidget);
    expect(navLabelColor(tester, 'Mapa'), UnifeiColors.primary);
    expect(navLabelColor(tester, 'Início'), UnifeiColors.textSecondary);
  });

  testWidgets('navegar para uma matéria ativa a aba Matérias', (tester) async {
    await pumpApp(tester);

    await tester.tap(find.text('Abrir Cálculo II'));
    await tester.pumpAndSettle();

    expect(find.text('Matéria calculo-2'), findsOneWidget);
    expect(navLabelColor(tester, 'Matérias'), UnifeiColors.primary);
  });
}
