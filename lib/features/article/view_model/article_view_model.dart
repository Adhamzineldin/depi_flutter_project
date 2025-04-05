import '../model/article_model.dart';
import 'package:flutter/material.dart';

class ArticleViewModel extends ChangeNotifier {
  late Article article;

  void setArticleFromArguments(Map<String, dynamic> args) {
    article = Article.fromMap(args['article']);
    notifyListeners(); // optional since data is static
  }
}
