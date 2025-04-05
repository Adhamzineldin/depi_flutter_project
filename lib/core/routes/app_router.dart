import 'package:flutter/material.dart';

// Views
import '../../features/article/view/article_view.dart';
import '../../features/explore/view/explore_view.dart';
import '../../features/login/view/login_view.dart';
import '../../features/search_results/view/search_results_view.dart';

class AppRouter {
  static const String loginRoute = '/login';
  static const String exploreRoute = '/explore';
  static const String searchRoute = '/search';
  static const String articleRoute = '/article';

  static Map<String, WidgetBuilder> get routes => {
    loginRoute: (context) => const LoginView(),
    exploreRoute: (context) => const ExploreView(),
    searchRoute: (context) => const SearchResultsView(),
    articleRoute: (context) => const ArticleView(),
  };
}
