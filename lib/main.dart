import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';

// ViewModels
import 'features/article/view_model/article_view_model.dart';
import 'features/explore/view_model/explore_view_model.dart';
import 'features/search_results/view_model/search_results_view_model.dart';
import 'features/login/view_model/login_view_model.dart'; // if you create one

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ArticleViewModel()),
        ChangeNotifierProvider(create: (_) => ExploreViewModel()),
        ChangeNotifierProvider(create: (_) => SearchResultsViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
      ],
      child: MaterialApp(
        title: 'News App',
        theme: AppTheme.lightTheme,
        initialRoute: AppRouter.loginRoute,
        routes: AppRouter.routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
