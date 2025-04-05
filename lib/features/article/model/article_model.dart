class Article {
  final String? title;
  final String? author;
  final String? publishedAt;
  final String? content;
  final String? urlToImage;

  Article({
    this.title,
    this.author,
    this.publishedAt,
    this.content,
    this.urlToImage,
  });

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      title: map['title'],
      author: map['author'],
      publishedAt: map['publishedAt'],
      content: map['content'],
      urlToImage: map['urlToImage'],
    );
  }
}
