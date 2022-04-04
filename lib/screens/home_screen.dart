import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sabka_bazaar/models/home_list_model.dart';
import 'package:sabka_bazaar/utils/constants/constants.dart';
import 'package:sabka_bazaar/utils/custom_colors.dart';
import 'package:sabka_bazaar/widgets/common_widgets/custom_text_widgets.dart';
import 'package:sabka_bazaar/widgets/common_widgets/widgets.dart';
import 'package:sabka_bazaar/widgets/screen_widgets/home_screen_widgets/list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<HomeItems> _listItem = [];

  final List<Widget> _pages = [
    ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Image.asset(Constants.kFirst),
    ),
    ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Image.asset(Constants.kSecond),
    ),
    ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Image.asset(Constants.kThird),
    ),
  ];

  int _currentPage = 0;
  late Timer _timer;
  PageController? _pageController = PageController(
    initialPage: 0,
  );
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController?.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _pageController = null;
  }
Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/json/home.json');
    final data = await json.decode(response);
    HomeListItem allData = HomeListItem.fromJson(data);

    setState(() {
    _listItem = allData.items!;
    });
  }
  @override
  Widget build(BuildContext context) {
    readJson();
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
      body: Column(
        children: [
          Expanded(
              flex: 14,
              child: ListView.separated(
                itemCount: _listItem.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 5.8,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      // children: [Image.asset(Constants.kDivider)],
                    ),
                  );
                },
                itemBuilder: (context, index) => index == 0
                    ? Card(
                        elevation: 2,
                        child: SizedBox(
                          height: 150,
                          child: IconTheme(
                            data:
                                IconThemeData(color: CustomColors.kArrowColor),
                            child: Stack(
                              children: <Widget>[
                                PageView.builder(
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  controller: _pageController,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return _pages[index % _pages.length];
                                  },
                                ),
                                Positioned(
                                  bottom: 5.0,
                                  left: 0.0,
                                  right: 0.0,
                                  child: DotsIndicator(
                                    controller: _pageController!,
                                    itemCount: _pages.length,
                                    onPageSelected: (int page) {
                                      _pageController?.animateToPage(
                                        page,
                                        duration: Constants.kDuration,
                                        curve: Constants.kCurve,
                                      );
                                    },
                                  ),
                                ),
                                Positioned(
                                  left: 0.0,
                                  top: 70.0,
                                  child: TextButton(
                                    onPressed: () {
                                      _currentPage -= 1;
                                      _pageController?.animateToPage(
                                        _currentPage,
                                        duration:
                                            const Duration(milliseconds: 350),
                                        curve: Curves.easeIn,
                                      );
                                    },
                                    child: const PlainText(
                                      plainText: '',
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0.0,
                                  top: 70.0,
                                  child: TextButton(
                                    onPressed: () {
                                      _currentPage += 1;
                                      _pageController?.animateToPage(
                                        _currentPage,
                                        duration:
                                            const Duration(milliseconds: 350),
                                        curve: Curves.easeIn,
                                      );
                                    },
                                    child: const PlainText(
                                      plainText: '',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Card(
                        elevation: 2,
                        child: ListItem(
                          isImageFirst: index % 2 == 0 ? false : true,
                          itemData: _listItem[index-1],
                          ind: (index - 1),
                        ),
                      ),
              ),
          ),
        ],
      ),
    );
  }
}
