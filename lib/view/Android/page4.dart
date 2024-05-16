import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_converter/controller/ai_provoider.dart';
import 'package:platform_converter/controller/theme_provider.dart';
import 'package:provider/provider.dart';

class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            title: Text("Profile"),
            trailing: Switch(
              value: false,
              onChanged: (value) {},
            ),
          ),
          ListTile(
            title: Text("Theme"),
            trailing: Consumer<ThemeProvider>(
              builder: (BuildContext context, value, Widget? child) {
                return DropdownButton(
                  value: value.themeMode,
                  items: [
                    DropdownMenuItem(child: Text("System"), value: 0),
                    DropdownMenuItem(child: Text("Light"), value: 1),
                    DropdownMenuItem(child: Text("Dark"), value: 2),
                  ],
                  onChanged: (value) async {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .changeTheme(value ?? 0);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
