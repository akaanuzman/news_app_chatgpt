// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:news_app_chatgpt/features/models/news_model.dart';
import 'package:news_app_chatgpt/features/view_models/splash_view_model.dart';
import 'package:news_app_chatgpt/products/constants/index.dart';
import 'package:news_app_chatgpt/products/widgets/alert_dialog/approve_dialog.dart';
import 'package:provider/provider.dart';

import '../../products/services/api_service.dart';

class NewsViewModel with ChangeNotifier {
  String _baseUrl =
      "${AppConstants.newsBaseUrl}${Endpoint.search.name}?q=example&lang=en&max=10&apikey=";

  List<NewsModel> _newsList = [];
  List<NewsModel> get newsList => _newsList;
  String? _errorMessage;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  /// This method is used to fetch news from api
  /// If there is an error, an alert dialog will appear. if there is no error, the method will continue.
  Future<void> fetchNews(BuildContext context) async {
    final splashViewModel =
        Provider.of<SplashViewModel>(context, listen: false);

    if (splashViewModel.securityKeysModel == null) return;
    if (splashViewModel.securityKeysModel!.newsApiKey == null) return;

    _baseUrl += splashViewModel.securityKeysModel!.newsApiKey!;

    (List<NewsModel>, String?) result =
        await ApiService.fetchAllData<NewsModel>(
      url: _baseUrl,
      model: const NewsModel(),
      key: ResponseKeys.articles.name,
    );

    _newsList = result.$1;
    _errorMessage = result.$2;
    _isLoading = false;

    if (_errorMessage != null) {
      await ApproveDialog.show(
        context: context,
        title: StringConstants.somethingWentWrong,
        content: _errorMessage!,
      );
    }
    notifyListeners();
  }

  void onDispose() {
    _newsList = [];
    _errorMessage = null;
    _isLoading = true;
    _baseUrl =
        "${AppConstants.newsBaseUrl}${Endpoint.search.name}?q=example&lang=en&max=10&apikey=";
  }
}
