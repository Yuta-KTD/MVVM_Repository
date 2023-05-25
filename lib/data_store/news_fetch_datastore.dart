import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_repository/data_store/news_fetch_datastore_interface.dart';
import 'package:mvvm_repository/model/news_fetch_response_model.dart';
import 'package:mvvm_repository/model/news_fetch_response_models.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// APIとの通信を担当。今回通信するAPIはNews API。
class NewsFetchDataStore implements NewsFetchDataStoreInterface {
  final Dio dio;
  NewsFetchDataStore({required this.dio});

  @override
  Future<NewsFetchResponseModels> fetchNewsData() async {
    final key = dotenv.env['API_KEY'];
    final url = 'https://newsapi.org/v2/top-headlines?country=jp&apiKey=$key';

    try {
      final response = await dio.get(url);
      final responseData = response.data;
      final List<dynamic> datas = responseData['articles'];
      final models = NewsFetchResponseModels();

      for (var element in datas) {
        final model = NewsFetchResponseModel.fromData(element);
        models.datas.add(model);
      }

      return models;
    } on Exception catch (exception) {
      debugPrint('faild');
      throw NewsApiException(exception.toString()).exception;
    } finally {
      debugPrint('End fetchNewsData from datastore.');
    }
  }
}

class NewsApiException {
  final String _exception;

  NewsApiException(this._exception);

  String get exception => _exception;
}
