import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_repository/data_store/dio_provider.dart';
import 'package:mvvm_repository/data_store/news_fetch_datastore.dart';
import 'package:mvvm_repository/data_store/news_fetch_datastore_interface.dart';

final newsFetchDataStoreProvider = Provider<NewsFetchDataStoreInterface>(
    (ref) => NewsFetchDataStore(dio: ref.read(dioProvider)));
