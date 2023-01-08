import 'package:flutter/material.dart';

import '../constants.dart';
import 'constants/ConstantWidgits.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        Icon(
          Icons.home_rounded,
        ),
        Center(
          child: Text("Home"),
        ),
        Icon(
          Icons.video_library_rounded,
        ),
        Center(
          child: Text("Fitness"),
        ),
        Icon(
          Icons.account_circle_rounded,
        ),
        Center(
          child: Text("My page"),
        ),
      ],
    );
  }

  Widget getFooter() {
    List items = [
      Icons.home_rounded,
      Icons.pie_chart,
      Icons.video_library_rounded,
      Icons.account_circle_rounded,
    ];
    return Scaffold(
      body: Container(
        height: 90,
        width: double.infinity,
        decoration: BoxDecoration(
          color: white,
          border: Border(
            top: BorderSide(
              width: 1,
              color: black.withOpacity(0.06),
            ),
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(items.length, (index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    pageIndex = index;
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      items[index],
                      size: 28,
                      color: pageIndex == index ? thirdColor : black,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    pageIndex == index
                        ? Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                                color: thirdColor, shape: BoxShape.circle),
                          )
                        : Container()
                  ],
                ),
              );
            }),
          ),
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
