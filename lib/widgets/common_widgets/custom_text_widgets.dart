import 'package:flutter/material.dart';
import 'package:sabka_bazaar/utils/custom_colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  double? size = 20.0;
  FontWeight? fontWeight = FontWeight.normal;
  final Color? color = Colors.black;
  String? family = 'Shizuru-Regular';
  int? maxLines = 1;

  CustomText(
      {Key? key,
      required this.text,
      this.size,
      this.family,
      this.fontWeight,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
        fontFamily: family,
      ),
    );
  }
}

class PlainText extends StatelessWidget {
  final String plainText;
  const PlainText({Key? key, required this.plainText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      plainText,
      style:
          const TextStyle(color: CustomColors.kWhite, backgroundColor: Colors.black12),
    );
  }
}

class CustomTextStyle {
  static var textFormFieldRegular = const TextStyle(
      fontSize: 16,
      fontFamily: "Helvetica",
      color: Colors.black,
      fontWeight: FontWeight.w400,
  );

  static var textFormFieldLight =
      textFormFieldRegular.copyWith(fontWeight: FontWeight.w200);

  static var textFormFieldMedium =
      textFormFieldRegular.copyWith(fontWeight: FontWeight.w500);

  static var textFormFieldSemiBold =
      textFormFieldRegular.copyWith(fontWeight: FontWeight.w600);

  static var textFormFieldBold =
      textFormFieldRegular.copyWith(fontWeight: FontWeight.w700);

  static var textFormFieldBlack =
      textFormFieldRegular.copyWith(fontWeight: FontWeight.w900);
}
