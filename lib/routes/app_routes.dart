import 'package:go_router/go_router.dart';
import 'package:myapp/views/index.dart';

class AppRoutes {
  static String home = "/";
  static String createUpdate = "/create-update";
  static String editUpdate = "/edit-update";
  static String productDetail = "/product-detail";
  static String productListView = "/product-list-view";
}

final routesConfig = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: AppRoutes.createUpdate,
      builder: (context, state) => const CreateUpdateView(),
    ),
    GoRoute(
      path: '${AppRoutes.editUpdate}/:productId',
      builder: (context, state) => EditUpdateView(
        productId: state.pathParameters['productId']!,
      ),
    ),
    GoRoute(
      path: AppRoutes.productListView,
      builder: (context, state) => const ProductsListView(),
    ),
    GoRoute(
      path: '${AppRoutes.productDetail}/:productId',
      builder: (context, state) => ProductDetailView(
        productId: state.pathParameters['productId']!,
      ),
    ),
  ],
);
