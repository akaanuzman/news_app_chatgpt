enum AppRoutes {
  splash('/'),
  login('login'),
  home('home'),
  ;

  const AppRoutes(this.value);
  final String value;

  String get path => '/$value';
}
