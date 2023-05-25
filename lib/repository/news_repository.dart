import 'package:flutter/material.dart';
import 'package:mvvm_repository/data_store/news_fetch_datastore_interface.dart';
import 'package:mvvm_repository/model/news_fetch_response_models.dart';
import 'package:mvvm_repository/repository/news_repository_interface.dart';

class NewsRepository implements NewsRepositoryInterface {
  final NewsFetchDataStoreInterface dataStore;
  NewsRepository({required this.dataStore});

  @override
  Future<NewsFetchResponseModels> fetchNewsData() async {
    try {
      final data = await dataStore.fetchNewsData();
      return data;
    } on Exception catch (_) {
      rethrow;
    } finally {
      debugPrint('End fetchNewsData from repository.');
    }
  }
}
