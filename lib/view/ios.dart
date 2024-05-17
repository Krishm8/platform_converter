import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/controller/ai_provoider.dart';
import 'package:platform_converter/view/Ios/ipage1.dart';
import 'package:platform_converter/view/Ios/ipage2.dart';
import 'package:platform_converter/view/Ios/ipage3.dart';
import 'package:platform_converter/view/Ios/ipage4.dart';
import 'package:provider/provider.dart';

class IOSPage extends StatefulWidget {
  const IOSPage({super.key});

  @override
  State<IOSPage> createState() => _IOSPageState();
}

class _IOSPageState extends State<IOSPage> {
  int? page;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_add), label: "ADD"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_2), label: "CHAT"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.phone), label: "CALLLS"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings), label: "SETTINGS"),
        ],
        onTap: (value) {
          page = value;
        },
      ),
      tabBuilder: (context, index) {
        return CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              largeTitle: Text("IOS"),
              trailing: Consumer<AIprovider>(
                builder: (BuildContext context, AIprovider mainProvider,
                    Widget? child) {
                  return CupertinoSwitch(
                    value: mainProvider.isAndroid,
                    onChanged: (value) {
                      mainProvider.changeplatform(value);
                    },
                  );
                },
              ),
              stretch: true,
            ),
            SliverFillRemaining(
              child: PageView(
                children: [
                  if (page == 0) Ipage1(),
                  if (page == 1) Ipage2(),
                  if (page == 2) Ipage3(),
                  if (page == 3) Ipage4(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
