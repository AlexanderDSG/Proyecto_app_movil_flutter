import 'package:go_router/go_router.dart';
import 'package:myapp/views/index.dart';

class AppRoutes {
  static String home = "/";
  static String createUpdate= "/create-update";
  static String productDetail = "/product-detail";
  static String productListView  = "/product-list-view";
}

//importar librerias y clases de views
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
      path: AppRoutes.productDetail,
      builder: (context, state) => const ProductDetailView(),
    ),
    GoRoute(
      path: AppRoutes.productListView,
      builder: (context, state) => const ProductsListView(),
    ),
  ]
);