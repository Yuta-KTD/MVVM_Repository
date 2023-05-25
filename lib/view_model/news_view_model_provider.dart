import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_repository/model/news_fetch_response_models.dart';
import 'package:mvvm_repository/repository/news_repository_provider.dart';
import 'package:mvvm_repository/view_model/news_view_model.dart';

final newsViewModelNotifierProvider =
    FutureProvider<NewsFetchResponseModels>((ref) async {
  final viewModel = NewsViewModel(repository: ref.read(newsRepositoryProvider));
  await viewModel.fetchNewsData();

  return viewModel.news;
});
