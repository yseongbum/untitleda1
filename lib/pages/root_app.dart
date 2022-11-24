import 'package:flutter/material.dart';
import 'package:untitleda1/data/bottom_items.dart';
import 'package:untitleda1/pages/searchpage.dart';
import 'package:untitleda1/pages/camerapage.dart';
import 'package:untitleda1/pages/settingpage.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: getFooteer(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        SearchPage(),
        //CameraPage(),
        SettingPage(),
      ],
    );
  }

  Widget getFooteer() {
    return Container(
      width: double.infinity,
      height: 90, //뒤에 카메라 버튼 위치도 이걸로 고정해야 할듯
      decoration: BoxDecoration(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
          top: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(3, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  pageIndex = index;
                });
              },
              child: Column(
                children: [
                  Icon(
                    iconItems[index],
                    color: pageIndex == index
                        ? colorItems[index]
                        : Colors.white.withOpacity(0.5),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(textItems[index],
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: pageIndex == index
                            ? colorItems[index]
                            : Colors.white.withOpacity(0.5),
                      ))
                ],
              ),
            );
          }),
        ),
      ), ////
    );
  }
}
