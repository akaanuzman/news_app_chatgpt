enum AppRoutes {
  splash('/'),
  login('login'),
  home('home'),
  newsDetail('/news-detail')
  ;

  const AppRoutes(this.value);
  final String value;

  String get path => '/$value';
}
