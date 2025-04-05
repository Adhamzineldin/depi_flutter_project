import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/widgets/article_item.dart';
import '../view_model/search_results_view_model.dart';

class SearchResultsView extends StatefulWidget {
  const SearchResultsView({Key? key}) : super(key: key);

  @override
  State<SearchResultsView> createState() => _SearchResultsViewState();
}

class _SearchResultsViewState extends State<SearchResultsView> {
  late final SearchResultsViewModel viewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final results = args['results'] ?? [];
    viewModel = Provider.of<SearchResultsViewModel>(context, listen: false);
    viewModel.setResults(results);
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SearchResultsViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Search Results', style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: vm.hasResults
          ? ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        itemCount: vm.results.length,
        itemBuilder: (context, index) {
          final article = vm.results[index];
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
      )
          : const Center(
        child: Text(
          'No results found.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ),
    );
  }
}
