import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_repository/data_store/news_fetch_datastore_provider.dart';
import 'package:mvvm_repository/repository/news_repository.dart';
import 'package:mvvm_repository/repository/news_repository_interface.dart';

final newsRepositoryProvider = Provider<NewsRepositoryInterface>(
    (ref) => NewsRepository(dataStore: ref.read(newsFetchDataStoreProvider)));
