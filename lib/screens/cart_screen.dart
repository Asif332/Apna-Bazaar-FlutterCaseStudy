import 'package:flutter/material.dart';
import 'package:sabka_bazaar/model_handlers/cart_handler.dart';
import 'package:sabka_bazaar/screens/checkout_screen.dart';
import 'package:sabka_bazaar/utils/CustomTextStyle.dart';
import 'package:sabka_bazaar/utils/CustomUtils.dart';
import 'package:sabka_bazaar/utils/constants/constants.dart';
import 'package:sabka_bazaar/utils/custom_colors.dart';
import 'package:sabka_bazaar/widgets/common_widgets/widgets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartHandler cartHandler = CartHandler();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                color: CustomColors.kNavColor,
                child: Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          child: const Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 10),
                            child: Text(
                              'My Cart',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        )),
                    Expanded(flex: 4, child: Container()),
                    Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 10, bottom: 0),
                            child: TextButton(
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                              onPressed: () => Navigator.of(context).pop(null),
                            ),
                          ),
                        ))
                  ],
                ),
              )),
          Expanded(
            flex: 10,
            child: cartHandler.getProductCount() >= 0
                ? Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 15,
                          child: Container(
                            alignment: Alignment.center,
                            child: ListView(
                              children: <Widget>[createSubTitle(), createCartList(), footer(context)],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            width: (MediaQuery.of(context).size.width) - 20,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 40),
                              child: longButtons(
                                'Checkout',
                                () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CheckoutScreen()));
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Expanded(
                            flex: 15,
                            child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'No items in your cart',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontFamily: 'RobotoCondensed',
                                        decoration: TextDecoration.none),
                                  ),
                                  Text(
                                    'Your favourite items are just a click away',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontFamily: 'RobotoCondensed',
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none),
                                  ),
                                ],
                              ),
                            )),
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            width: (MediaQuery.of(context).size.width) - 20,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 40),
                              child: longButtons(
                                'Start Shopping',
                                () {
                                  Navigator.of(context).pop(null);
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  createCartList() {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, position) {
        if (position % 2 == 0) {
          return createCartListItem("Kiwi","Kiwis are oval shaped with a brownish outer skin. The flesh is bright green and juicy with tiny edible black seeds.", "\RS.89.00", Constants.kkiwi);
        } else {
          return createCartListItem("Bread", "Cakes and Dairy" , "\RS.45.00", Constants.kBread);
        }
      },
      itemCount: 2,
    );
  }

  createCartListItem(String productTitle, String desc, String price, String productImage) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    color: Colors.blue.shade200,
                    image: DecorationImage(
                        image: AssetImage(productImage))),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 8, top: 4),
                        child: Text(
                          productTitle,
                          maxLines: 2,
                          softWrap: true,
                          style: CustomTextStyle.textFormFieldSemiBold
                              .copyWith(fontSize: 14),
                        ),
                      ),
                      Utils.getSizedBox(height: 6),
                      Text(
                        desc,
                        style: CustomTextStyle.textFormFieldRegular
                            .copyWith(color: Colors.grey, fontSize: 14),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              price,
                              style: CustomTextStyle.textFormFieldBlack
                                  .copyWith(color: Colors.green),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Icon(
                                    Icons.remove,
                                    size: 24,
                                    color: Colors.grey.shade700,
                                  ),
                                  Container(
                                    color: Colors.grey.shade200,
                                    padding: const EdgeInsets.only(
                                        bottom: 2, right: 12, left: 12),
                                    child: Text(
                                      "1",
                                      style:
                                          CustomTextStyle.textFormFieldSemiBold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.add,
                                    size: 24,
                                    color: Colors.grey.shade700,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                flex: 100,
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 10, top: 8),
            child: const Icon(
              Icons.close,
              color: Colors.white,
              size: 20,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Colors.green),
          ),
        )
      ],
    );
  }

footer(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Utils.getSizedBox(height: 100),
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Text(
                  "Total",
                  style: CustomTextStyle.textFormFieldMedium.copyWith(color: Colors.grey, fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  "\RS.135.00",
                  style: CustomTextStyle.textFormFieldBlack.copyWith(color: Colors.greenAccent.shade700, fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      ),
      margin: EdgeInsets.only(top: 16),
    );
  }

    createSubTitle() {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "Total(2) Items",
        style: CustomTextStyle.textFormFieldBold.copyWith(fontSize: 15, color: Colors.grey),
      ),
      margin: EdgeInsets.only(left: 12, top: 0),
    );
  }

}
