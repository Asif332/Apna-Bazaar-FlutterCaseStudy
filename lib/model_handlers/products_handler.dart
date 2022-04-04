import 'package:sabka_bazaar/utils/constants/constants.dart';

class ProductsHandler {
  String getTitleForCategory(SelectedCategory category) {
    String selectedCategory = "";
    switch (category) {
      case SelectedCategory.foodAndVeg:
        selectedCategory = _categoryList[0];
        break;
      case SelectedCategory.bakery:
        selectedCategory = _categoryList[1];
        break;
      case SelectedCategory.beverages:
        selectedCategory = _categoryList[2];
        break;
      case SelectedCategory.beauty:
        selectedCategory = _categoryList[3];
        break;
      case SelectedCategory.babycare:
        selectedCategory = _categoryList[4];
        break;
    }
    return selectedCategory;
  }
  final List<String> _categoryList = [
    'Fruits & Vegetables',
    'Bakery, Cakes and Dairy',
    'Beverages',
    'Beauty and Hygiene',
    'Baby Care'
  ];
  List<String> getCategories() => _categoryList;

  String getProductsFor(SelectedCategory category) {
    String selectedCategory = "";
    switch (category) {
      case SelectedCategory.foodAndVeg:
        selectedCategory = _categoryList[0];
        break;
      case SelectedCategory.bakery:
        selectedCategory = _categoryList[1];
        break;
      case SelectedCategory.beverages:
        selectedCategory = _categoryList[2];
        break;
      case SelectedCategory.beauty:
        selectedCategory = _categoryList[3];
        break;
      case SelectedCategory.babycare:
        selectedCategory = _categoryList[4];
        break;
    }
    return selectedCategory;
  }
}
