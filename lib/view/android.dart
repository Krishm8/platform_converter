import 'package:flutter/material.dart';
import 'package:platform_converter/controller/ai_provoider.dart';
import 'package:platform_converter/controller/theme_provider.dart';
import 'package:platform_converter/modal/contact_modal.dart';
import 'package:platform_converter/view/Android/page1.dart';
import 'package:platform_converter/view/Android/page2.dart';
import 'package:platform_converter/view/Android/page3.dart';
import 'package:platform_converter/view/Android/page4.dart';
import 'package:provider/provider.dart';

class AndroidPage extends StatefulWidget {
  const AndroidPage({super.key});

  @override
  State<AndroidPage> createState() => _AndroidPageState();
}

class _AndroidPageState extends State<AndroidPage> {


  @override
  Widget build(BuildContext context) {
    return Consumer<AIprovider>(
      builder: (BuildContext context, AIprovider value, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Platform Converter ${value.isAndroid}"),
            actions: [
              Switch(
                value: value.isAndroid,
                onChanged: (newValue) {
                  Provider.of<AIprovider>(context, listen: false)
                      .changeplatform(newValue);
                },
              ),
            ],
          ),
          body: DefaultTabController(
            length: 4, // Number of tabs
            child: Column(
              children: [
                TabBar(
                  indicatorColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  unselectedLabelStyle: TextStyle(
                    fontSize: 13,
                  ),
                  automaticIndicatorColorAdjustment: true,
                  indicatorPadding: EdgeInsets.only(top: 5, left: 5, right: 5),
                  indicatorSize: TabBarIndicatorSize.label,
                  labelPadding: EdgeInsets.only(top: 10, left: 5, right: 20),
                  labelColor: Colors.blue,
                  tabs: [
                    Tab(icon: Icon(Icons.person_add)),
                    Tab(text: "CHATS"),
                    Tab(text: "CALLS"),
                    Tab(text: "SETTINGS"),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                     Page1(),
                      Page2(),
                      Page3(),
                      Page4(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
