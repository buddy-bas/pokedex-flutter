import 'package:go_router/go_router.dart';
import 'package:pokedex/details/view/detail_page.dart';

import 'package:pokedex/home/home.dart';

class AppRouter {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/detail',
        name: 'detail',
        builder: (context, state) => const DetailView(),
      ),
    ],
  );
}
