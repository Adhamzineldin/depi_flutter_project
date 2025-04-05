import 'package:flutter/material.dart';
import '../../../core/services/news_api_service.dart';

class ExploreViewModel extends ChangeNotifier {
  final NewsApiService _newsApiService = NewsApiService();

  List<Map<String, dynamic>> _articles = [];
  String _selectedCategory = 'general';
  bool _isLoading = true;

  List<Map<String, dynamic>> get articles => _articles;
  String get selectedCategory => _selectedCategory;
  bool get isLoading => _isLoading;

  ExploreViewModel() {
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    _isLoading = true;
    notifyListeners();

    try {
      _articles = await _newsApiService.fetchArticles(category: _selectedCategory);
    } catch (e) {
      debugPrint('Error fetching articles: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  void changeCategory(String category) {
    _selectedCategory = category;
    fetchArticles();
  }
}
