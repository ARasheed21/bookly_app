

import 'package:go_router/go_router.dart';

import '../../features/home/presentation/screens/book_details_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/search/presentation/screens/search_screen.dart';
import '../../features/splash/presentation/screens/SplashScreen.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsScreen = '/bookDetailsScreen';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: kBookDetailsScreen,
        builder: (context, state) => const BookDetailsScreen(),
      ),
    ],
  );
}