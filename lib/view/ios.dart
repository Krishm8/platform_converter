import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/controller/ai_provoider.dart';
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
          page=value;
          setState(() {

          });
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
                  if(page==0)
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          child: Icon(CupertinoIcons.camera),
                        ),
                        CupertinoListTile(
                          leading: Icon(CupertinoIcons.person),
                          title: CupertinoTextFormFieldRow(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        CupertinoListTile(
                          leading: Icon(CupertinoIcons.person),
                          title: CupertinoTextFormFieldRow(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        CupertinoListTile(
                          leading: Icon(CupertinoIcons.person),
                          title: CupertinoTextFormFieldRow(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  if(page==1)
                  Center(child: Text("No any chats yet...")),
                  if(page==2)
                  Center(child: Text("No any calls yet...")),
                  if(page==3)
                  Container(
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
