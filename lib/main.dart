import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/controller/ai_provoider.dart';
import 'package:platform_converter/controller/theme_provider.dart';
import 'package:platform_converter/view/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AIprovider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      builder: (context, child) {
        return Consumer<AIprovider>(
          builder: (BuildContext context, AIprovider value, Widget? child) {
            if (value.isAndroid) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData.light(),
                darkTheme: ThemeData.dark(),
                themeMode: Provider.of<ThemeProvider>(context).getThemeMode(),
                routes: {
                  "/": (context) => HomePage(),
                },
              );
            } else {
              return CupertinoApp(
                debugShowCheckedModeBanner: false,
                routes: {
                  "/": (context) => HomePage(),
                },
              );
            }
          },
        );
      },
    );
  }
}
