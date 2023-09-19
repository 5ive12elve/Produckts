
import 'package:produckts/model/product_model.dart';
import '../../../services/product_service.dart';

class ProductController {
  Future<product_model> getProducts() async {
    try {
      return await ProductService.fetchProducts();
    } catch (e) {
      throw e;
    }
  }
}
