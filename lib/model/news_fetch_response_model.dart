class NewsFetchResponseModel {
  final String? author;
  final String title;
  final String url;

  NewsFetchResponseModel({
    this.author,
    required this.title,
    required this.url,
  });

  factory NewsFetchResponseModel.fromData(data) {
    final author = data['author'];
    final title = data['title'];
    final url = data['url'];

    final model = NewsFetchResponseModel(
      author: author,
      title: title,
      url: url,
    );

    return model;
  }
}
