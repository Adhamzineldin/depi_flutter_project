import 'package:flutter/material.dart';

class SearchResultsViewModel extends ChangeNotifier {
  List<Map<String, dynamic>> results = [];

  void setResults(List<dynamic> articles) {
    results = articles.cast<Map<String, dynamic>>();
    notifyListeners();
  }

  bool get hasResults => results.isNotEmpty;
}
