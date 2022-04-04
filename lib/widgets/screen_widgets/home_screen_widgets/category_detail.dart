import 'package:flutter/material.dart';
import 'package:sabka_bazaar/utils/constants/constants.dart';
import 'package:sabka_bazaar/screens/products_screen.dart';
import 'package:sabka_bazaar/widgets/common_widgets/custom_text_widgets.dart';
import 'package:sabka_bazaar/widgets/common_widgets/widgets.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails(
      {Key? key,
        required this.indexValue,
        required this.title,
        required this.subTitle,
        required this.buttonTitle})
      : super(key: key);
  final int indexValue;
  final String title;
  final String subTitle;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          CustomText(
            text: title,
            size: 15,
            family: 'Merriweather-Light',
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomText(
            text: subTitle,
            size: 10,
            family: 'PTSans-Bold',
            fontWeight: FontWeight.normal,
            maxLines: 2,
          ),
          const SizedBox(
            height: 20,
          ),
          longButtons(buttonTitle, () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductsScreen(category: SelectedCategory.values[indexValue])));
          }),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
