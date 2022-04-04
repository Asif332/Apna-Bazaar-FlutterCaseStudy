import 'package:sabka_bazaar/models/product_list_model.dart';

class CartHandler {
  final List<ProductItem> _listItem = [];

  void addItemToCart(ProductItem item) {
    _listItem.add(item);
  }
  int getProductCount() {
    return _listItem.length;
  }
}