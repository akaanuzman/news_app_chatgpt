import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../view_models/news_view_model.dart';
import '../../../view_models/user_view_model.dart';
import '../home_view.dart';
import 'package:provider/provider.dart';

mixin HomeMixin on State<HomeView> {
  String get today => "Today, ${DateFormat.yMMMMd().format(DateTime.now())}";

  @override
  void initState() {
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);
    final newsViewModel = Provider.of<NewsViewModel>(context, listen: false);

    userViewModel.readUserModel(context);
    newsViewModel.fetchNews(context);
    super.initState();
  }
}
