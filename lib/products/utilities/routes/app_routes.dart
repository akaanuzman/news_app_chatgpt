enum AppRoutes {
  splash('/'),
  login('login'),
  navBar('navBar'),
  home('home'),
  ;

  const AppRoutes(this.value);
  final String value;

  String get path => '/$value';
}
