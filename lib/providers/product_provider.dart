import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/types/product.dart';

final dioProvider = Provider<Dio>((ref) => Dio(BaseOptions(
  validateStatus: (s) => true,
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 3),
)));

final productsProvider = FutureProvider<List<Product>>((ref) async {
  final dio = ref.watch(dioProvider);
  final response = await dio.get("https://pucei.edu.ec:9101/api/v2/products");

  if (response.statusCode != 200) return [];
  
  final products = (response.data as List<dynamic>).map((item) {
    return Product.fromJson(item);
  }).toList();

  return products;
});

final productByIdProvider = FutureProvider.family<Product, String>((ref, id) async {
  final dio = ref.watch(dioProvider);
  final response = await dio.get("https://pucei.edu.ec:9101/api/v2/products/$id");

  if (response.statusCode != 200) return Product(id: "", name: "err", price: 0, stock: 0, urlImage: "", description: "err", v: 0);

  final product = Product.fromJson(response.data);

  return product;
});

//actualizar
final productUpdateProvider = StateNotifierProvider<ProductUpdateNotifier, bool>((ref) {
  final dio = ref.watch(dioProvider);
  return ProductUpdateNotifier(dio);
});

class ProductUpdateNotifier extends StateNotifier<bool> {
  final Dio _dio;

  ProductUpdateNotifier(this._dio) : super(false);

  Future<bool> updateProduct(Product product) async {
    try {
      final response = await _dio.patch(
        "https://pucei.edu.ec:9101/api/v2/products/${product.id}",
        data: product.toJson(),
      );
      
      if (response.statusCode == 200) {
        state = true;
        return true;
      } else {
        print('Error: ${response.statusCode} - ${response.data}');
        state = false;
        return false;
      }
    } catch (e) {
      print('Exception: $e');
      state = false;
      return false;
    }
  }
}

//eliminar
final productDeleteProvider = StateNotifierProvider<ProductDeleteNotifier, bool>((ref) {
  final dio = ref.watch(dioProvider);
  return ProductDeleteNotifier(dio);
});

class ProductDeleteNotifier extends StateNotifier<bool> {
  final Dio _dio;

  ProductDeleteNotifier(this._dio) : super(false);

  Future<bool> deleteProduct(String productId) async {
    try {
      final response = await _dio.delete(
        "https://pucei.edu.ec:9101/api/v2/products/$productId",
      );

      if (response.statusCode == 200) {
        state = true;
        return true;
      } else {
        print('Error: ${response.statusCode} - ${response.data}');
        state = false;
        return false;
      }
    } catch (e) {
      print('Exception: $e');
      state = false;
      return false;
    }
  }
}


