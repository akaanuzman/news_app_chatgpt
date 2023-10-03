import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../view_models/news_view_model.dart';
import '../../../view_models/user_view_model.dart';
import '../home_view.dart';
import 'package:provider/provider.dart';

mixin HomeMixin on State<HomeView> {
  String get today => "Today, ${DateFormat.yMMMMd().format(DateTime.now())}";

  late final UserViewModel userViewModel;
  late final NewsViewModel newsViewModel;
  @override
  void initState() {
    userViewModel = Provider.of<UserViewModel>(context, listen: false);
    newsViewModel = Provider.of<NewsViewModel>(context, listen: false);

    userViewModel.readUserModel(context);
    newsViewModel.fetchNews(context);
    super.initState();
  }

  @override
  void dispose() {
    newsViewModel.onDispose();
    super.dispose();
  }
}
