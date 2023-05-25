import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_repository/view_model/news_view_model_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsWodget extends ConsumerWidget {
  const NewsWodget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('news'),
      ),
      body: ref.watch(newsViewModelNotifierProvider).when(
            data: (articles) => ListView.builder(
              itemCount: articles.datas.length,
              itemBuilder: (context, index) {
                final news = articles.datas[index];
                return _newsItem(news.title, news.author!, news.url);
              },
            ),
            error: (error, _) => const Center(
              child: Text('通信エラー'),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}

Widget _newsItem(String title, String author, String url) {
  return GestureDetector(
    child: Container(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),
          Text(
            author,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    ),
    onTap: () {
      _launchUrl(url);
    },
  );
}

Future _launchUrl(String url) async {
  final uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    debugPrint('Could not launch: $uri');
  }
}
