enum AppRoutes {
  splash('/'),
  onBoard('onBoard'),
  login('login'),
  register('register'),
  navBar('navBar'),
  home('home'),
  ;

  const AppRoutes(this.value);
  final String value;

  String get path => '/$value';
}
