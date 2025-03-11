import 'package:go_router/go_router.dart';
import 'package:tiles_shop_management/screens/auth/login_screen.dart';
import 'package:tiles_shop_management/screens/maintanence/product_details.dart';
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
        path: '/details',
        builder: (context, state) => ProductDetails(),
      ),
      GoRoute(
      path: '/tabs/:tab', // Define dynamic parameter
      builder: (context, state) {
        final String? tab = state.pathParameters['tab']; // Get tab parameter
        final int tabIndex = int.tryParse(tab ?? '0') ?? 0;
        return BottomTabScreen(initialTab: tabIndex); // Pass it to the screen
      },
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