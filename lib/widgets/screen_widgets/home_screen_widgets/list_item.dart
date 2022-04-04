import 'category_image.dart';
import 'category_detail.dart';
import 'package:flutter/material.dart';
import 'package:sabka_bazaar/models/home_list_model.dart';

class ListItem extends StatelessWidget {
  const ListItem(
      {Key? key,
      required this.isImageFirst,
      required this.itemData,
      required this.ind})
      : super(key: key);

  final int ind;
  final bool isImageFirst;
  final HomeItems itemData;

  @override
  Widget build(BuildContext context) {
    var columnWidget = CategoryDetails(
      title: itemData.titleText ?? "",
      subTitle: itemData.detailedText ?? "",
      buttonTitle: itemData.buttonTitleText ?? "",
      indexValue: ind,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: isImageFirst
          ? [
              CategoryImage(
                image: itemData.imageName ?? "",
              ),
              columnWidget
            ]
          : [
              columnWidget,
              CategoryImage(
                image: itemData.imageName ?? "",
              )
            ],
    );
  }
}
