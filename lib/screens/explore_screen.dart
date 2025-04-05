import 'package:flutter/material.dart';
import '../core/services/news_api_service.dart';
import '../core/routes/app_router.dart';
import '../core/widgets/article_item.dart';
import '../core/widgets/category_chip.dart';
import '../core/widgets/featured_article.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final NewsApiService _newsApiService = NewsApiService();
  List<Map<String, dynamic>> _articles = [];
  String _selectedCategory = 'general';

  @override
  void initState() {
    super.initState();
    _fetchArticles();
  }

  Future<void> _fetchArticles() async {
    try {
      final articles = await _newsApiService.fetchArticles(category: _selectedCategory);
      setState(() {
        _articles = articles;
      });
    } catch (e) {
      debugPrint('Error fetching articles: $e');
    }
  }

  void _changeCategory(String category) {
    setState(() {
      _selectedCategory = category;
    });
    _fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAppBar(context),
            _buildCategoryList(),
            const SizedBox(height: 16),
            Expanded(
              child: _buildArticlesList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Explore',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, AppRouter.searchRoute);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryList() {
    const categories = ['general', 'technology', 'business', 'entertainment'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: categories.map((category) {
          return GestureDetector(
            onTap: () => _changeCategory(category),
            child: CategoryChip(
              label: category[0].toUpperCase() + category.substring(1),
              isSelected: _selectedCategory == category,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildArticlesList() {
    if (_articles.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      itemCount: _articles.length,
      itemBuilder: (context, index) {
        final article = _articles[index];

        return ArticleItem(
          title: article['title'] ?? 'No title',
          author: article['author'] ?? 'Unknown',
          imagePath: article['urlToImage'] ?? 'assets/images/placeholder.png',
          id: article['url'], // Using article URL as an ID (since NewsAPI doesn't provide an ID)
          onTap: () => Navigator.pushNamed(
            context,
            AppRouter.articleRoute,
            arguments: {'id': article['url'], 'article': article},
          ),
        );
      },
    );
  }

}
