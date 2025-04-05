import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsApiService {
  static const String _apiKey = '4c11a5b6e36f4c518a6a51d11debe8d7';
  static const String _baseUrl = 'https://newsapi.org/v2/top-headlines';

  Future<List<Map<String, dynamic>>> fetchArticles({String category = 'general'}) async {
    final url = Uri.parse('$_baseUrl?country=us&category=$category&apiKey=$_apiKey');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data['articles']);
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
