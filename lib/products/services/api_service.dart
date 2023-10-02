// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_chatgpt/products/base/base_model.dart';
import 'package:news_app_chatgpt/products/constants/string_constants.dart';

enum Endpoint { search }

enum ResponseKeys { articles }

/// `ApiService` class
/// This class is written to manage the methods to be done in the api.
@immutable
final class ApiService {
  const ApiService._();

  /// Generic method that allows you to fetch data from the api
  /// Parameters:
  /// [url] -> API Url
  /// [model] -> Model created from json data returned from api
  /// [key] -> Key value of the data to be fetched from the api
  ///
  /// Returns: Returns a tuple data type. First returned value in Tuple [Generic] list of data retrieved from api
  /// Second value [error] message
  static Future<(List<T>, String?)> fetchAllData<T extends BaseModel>({
    required String url,
    required T model,
    required String key,
  }) async {
    final Dio dio = Dio();

    try {
      final Response response = await dio.get(url);
      var array = <T>[];

      if (response.statusCode == HttpStatus.ok) {
        Iterable listBest = response.data[key];
        array = listBest.map<T>((element) => model.fromJson(element)).toList();
        return (array, null);
      } else {
        return (array, StringConstants.somethingWentWrong);
      }
    } on DioException catch (e) {
      var array = <T>[];

      if (e.response == null && e.response?.data['errors'] == null)
        return (array, StringConstants.somethingWentWrong);

      String? errorMessage = e.response!.data['errors'].first as String?;
      return (array, errorMessage);
    }
  }
}
