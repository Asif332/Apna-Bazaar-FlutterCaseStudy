import 'package:flutter/material.dart';
import 'package:sabka_bazaar/utils/constants/constants.dart';
import 'package:sabka_bazaar/model_handlers/products_handler.dart';
import 'package:sabka_bazaar/screens/cart_screen.dart';
import 'package:sabka_bazaar/utils/custom_colors.dart';
import 'package:sabka_bazaar/widgets/screen_widgets/products_screen_widgets/product_list_item.dart';
import 'package:get/get.dart';
import '../controllers/products_controller.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key, required this.category}) : super(key: key);
  final SelectedCategory category;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  int numberOfItems = 0;
  String dropdownValue = ProductsHandler().getCategories().first;
  final ProductController productController = Get.put(ProductController());
  ProductsHandler productHandler = ProductsHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Container(
          margin: const EdgeInsets.all(0),
          height: 40,
          alignment: Alignment.center,
          width: (MediaQuery.of(context).size.width),
          color: Colors.grey.shade200,
          child: const Text(
            'Copyright © 2020-2023 Sabka Bazaar Grocery Supplies Pvt Ltd',
            style: TextStyle(fontSize: 10, color: Colors.black),
          ),
        )
      ],
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: Image.asset(Constants.kSabkaBazaar),
        ),
        elevation: 2,
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                        fullscreenDialog: true),
                  );
                },
                child: Container(
                  color: Colors.grey.shade200,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.shopping_cart,
                        color: Colors.red,
                        size: 26.0,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('$numberOfItems items',
                          style: TextStyle(color: Colors.grey.shade700))
                    ],
                  ),
                ),
              )),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 14,
            child: Column(
              children: [
                Container(
                  color: CustomColors.kPinkColor,
                  child: DropdownButton(
                    dropdownColor: Colors.grey.shade600,
                    underline: Container(
                      color: CustomColors.kPinkColor,
                    ),
                    isExpanded: true,
                    value: dropdownValue,
                    icon: const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    ),
                    elevation: 16,
                    style: const TextStyle(color: Colors.white),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: productHandler
                        .getCategories()
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(value)),
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  child: Obx(
                      () {
                        if (productController.isLoading.value) {
                          return const Center(child: CircularProgressIndicator());
                        } else {
                          return ListView(
                            children: const [
                              ProductItem(),
                            ],
                          );
                        }
                      }

                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
