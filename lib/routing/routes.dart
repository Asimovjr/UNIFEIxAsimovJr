/// Caminhos de todas as rotas do app.
///
/// A navegação usa estas constantes em vez do texto do caminho:
///
/// ```dart
/// context.go(Routes.materias);
/// context.go(Routes.materia('calculo-2'));
/// ```
abstract class Routes {
  // Abas da barra de navegação inferior.
  static const String home = '/';
  static const String materias = '/materias';
  static const String carreira = '/carreira';
  static const String mapa = '/mapa';
  static const String menu = '/menu';

  // Telas dentro de uma aba. Rotas com parâmetro ganham uma função que monta
  // o caminho completo.
  static String materia(String id) => '$materias/$id';
}
