import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/article_view_model.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final viewModel = Provider.of<ArticleViewModel>(context, listen: false);
    viewModel.setArticleFromArguments(args);

    return Consumer<ArticleViewModel>(
      builder: (context, vm, _) {
        final article = vm.article;
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeaderImage(context, article.urlToImage),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildArticleTitle(article.title),
                      const SizedBox(height: 8),
                      _buildArticleMetadata(article.author, article.publishedAt),
                      const SizedBox(height: 16),
                      _buildArticleContent(article.content),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeaderImage(BuildContext context, String? imageUrl) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageUrl != null
                  ? NetworkImage(imageUrl)
                  : const AssetImage('assets/images/placeholder.png') as ImageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 16,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }

  Widget _buildArticleTitle(String? title) {
    return Text(
      title ?? 'No Title Available',
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildArticleMetadata(String? author, String? publishedAt) {
    return Text(
      '${author ?? 'Unknown Author'} • ${publishedAt?.split('T')[0] ?? 'Unknown Date'}',
      style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
    );
  }

  Widget _buildArticleContent(String? content) {
    return Text(
      content ?? 'No content available for this article.',
      style: const TextStyle(fontSize: 16, height: 1.5),
    );
  }
}
