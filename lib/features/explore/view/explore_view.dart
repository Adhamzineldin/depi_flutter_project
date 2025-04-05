import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/article_item.dart';
import '../../../core/widgets/category_chip.dart';
import '../../../core/routes/app_router.dart';
import '../view_model/explore_view_model.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  static const categories = ['general', 'technology', 'business', 'entertainment'];

  @override
  Widget build(BuildContext context) {
    return Consumer<ExploreViewModel>(
      builder: (context, vm, _) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAppBar(context),
                _buildCategoryList(vm),
                const SizedBox(height: 16),
                Expanded(
                  child: vm.isLoading ? const Center(child: CircularProgressIndicator()) : _buildArticlesList(vm, context),
                ),
              ],
            ),
          ),
        );
      },
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
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => Navigator.pushNamed(context, AppRouter.searchRoute),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryList(ExploreViewModel vm) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: categories.map((category) {
          return GestureDetector(
            onTap: () => vm.changeCategory(category),
            child: CategoryChip(
              label: category[0].toUpperCase() + category.substring(1),
              isSelected: vm.selectedCategory == category,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildArticlesList(ExploreViewModel vm, BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      itemCount: vm.articles.length,
      itemBuilder: (context, index) {
        final article = vm.articles[index];
        return ArticleItem(
          title: article['title'] ?? 'No title',
          author: article['author'] ?? 'Unknown',
          imagePath: article['urlToImage'] ?? 'assets/images/placeholder.png',
          id: article['url'],
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
