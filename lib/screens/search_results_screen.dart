import 'package:flutter/material.dart';
import '../core/routes/app_router.dart';
import '../core/widgets/article_item.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final List<dynamic> searchResults = arguments['results'] ?? [];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Search Results',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: searchResults.isEmpty
          ? const Center(
        child: Text(
          'No results found.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          final article = searchResults[index];

          return ArticleItem(
            title: article['title'] ?? 'No title',
            author: article['author'] ?? 'Unknown',
            imagePath: article['urlToImage'] ?? 'assets/images/placeholder.png',
            id: article['url'], // Using article URL as ID
            onTap: () => Navigator.pushNamed(
              context,
              AppRouter.articleRoute,
              arguments: {'id': article['url'], 'article': article},
            ),
          );
        },
      ),
    );
  }
}
