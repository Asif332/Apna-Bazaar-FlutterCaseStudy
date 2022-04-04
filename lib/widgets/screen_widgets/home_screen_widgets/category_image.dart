import 'package:flutter/material.dart';

class CategoryImage extends StatelessWidget {
  const CategoryImage({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/$image.jpg',
      height: 100,
    );
  }
}
