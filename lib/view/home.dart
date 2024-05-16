import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/controller/ai_provoider.dart';
import 'package:platform_converter/view/android.dart';
import 'package:platform_converter/view/ios.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var isAndroid = Provider.of<AIprovider>(context, listen: false).isAndroid;
    if (isAndroid) {
      return AndroidPage();
    } else {
      return IOSPage();
    }
  }
}
