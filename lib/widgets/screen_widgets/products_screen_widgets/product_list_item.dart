import 'package:flutter/material.dart';
import 'package:sabka_bazaar/utils/constants/constants.dart';
import 'package:sabka_bazaar/widgets/common_widgets/widgets.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              'Fresho Kiwi - Green 3 pcs',
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    Positioned(
                      top: 10.0,
                      left: 20.0,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          Constants.kkiwi,
                          width: 20,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        Constants.kkiwi,
                      ),
                    ),
                    Positioned(
                      top: 20.0,
                      right: 20.0,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          Constants.kShellLife,
                          width: 50,
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text('3 pc (270g 300g)'),
                        ))
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(2),
                      child: Text(
                        'Kiwis are oval shaped with a brownish outer skin. The flesh is bright green and juicy with tiny edible black seeds.',
                        maxLines: 5,
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                    longButtons('Buy Now @ MRP Rs.87', () {})
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 2,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
