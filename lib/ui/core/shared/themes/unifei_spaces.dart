/// Escala de espaçamento e medidas de layout do Figma (variáveis
/// "draft/space").
abstract class UnifeiSpaces {
  static const double xxs = 2;
  static const double xs = 4;

  /// Entre [xs] e [sm].
  static const double xsm = 6;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;
  static const double xxxl = 32;

  /// Margem lateral da maioria das telas (Home).
  static const double screenGutter = 24;

  /// Margem lateral das telas com cabeçalho colorido (tela da matéria).
  static const double screenGutterCompact = 20;

  /// Distância entre as seções de uma tela.
  static const double sectionGap = 24;

  /// Margem da barra de navegação flutuante até as laterais e a base.
  static const double bottomNavMargin = 16;
  static const double bottomNavHeight = 72;

  /// Área mínima de toque.
  static const double touchTarget = 44;
}

/// Arredondamentos de borda do Figma.
abstract class UnifeiRadius {
  /// Etiquetas de categoria ("PRG", "PRAPE").
  static const double tag = 6;

  /// `radius/control`: controles pequenos e indicadores.
  static const double control = 8;

  /// Acessos rápidos e itens da barra de navegação.
  static const double button = 12;

  /// Células e eventos do calendário.
  static const double calendar = 17;

  /// Cards padrão e a barra de navegação.
  ///
  /// A variável `radius/card` do Figma vale 14, mas as telas oficiais usam 20
  /// nos cards.
  static const double card = 20;

  /// Cards em destaque (próxima atividade, avisos).
  static const double cardLarge = 22;

  /// Campo de busca.
  static const double search = 26;

  /// Cantos superiores da folha sobre um cabeçalho colorido.
  static const double sheet = 28;

  /// `radius/pill`: totalmente arredondado.
  static const double pill = 999;
}
