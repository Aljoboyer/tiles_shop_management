import 'package:go_router/go_router.dart';
import 'package:tiles_shop_management/screens/auth/login_screen.dart';
import 'package:tiles_shop_management/screens/tabs/bottomtab_screen.dart';
import 'package:tiles_shop_management/services/auth_service.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: '/tabs',
        builder: (context, state) => BottomTabScreen(),
      ),
      // GoRoute(
      //   path: '/product-details/:id',
      //   builder: (context, state) {
      //     final productId = state.pathParameters['id'];
      //     return ProductDetailsScreen(productId: productId!);
      //   },
      // ),
    ],
    redirect: (context, state) {
      final bool isLoggedIn = AuthService.isLoggedIn;
      if (!isLoggedIn && state.fullPath != '/') {
        return '/';
      }
      return null;
    },
  );
}