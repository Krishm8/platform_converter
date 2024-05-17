import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/controller/ai_provoider.dart';
import 'package:platform_converter/controller/theme_provider.dart';
import 'package:provider/provider.dart';

class Ipage4 extends StatefulWidget {
  const Ipage4({super.key});

  @override
  State<Ipage4> createState() => _Ipage4State();
}

class _Ipage4State extends State<Ipage4> {
  TextEditingController ProfileNameController = TextEditingController();
  TextEditingController ProfileBioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Consumer<AIprovider>(
                  builder: (BuildContext context, value, Widget? child) {
                    return CupertinoListSection(
                      header: Text("Change".toUpperCase()),
                      children: [
                        CupertinoListTile(
                          padding: EdgeInsets.all(15),
                          leading: Icon(CupertinoIcons.person),
                          title: Text("Profile"),
                          subtitle: Text("Update Profile Data"),
                          trailing: CupertinoSwitch(
                            value: false,
                            onChanged: (Value) {},
                          ),
                        ),
                        CupertinoListTile(
                          padding: EdgeInsets.all(15),
                          leading: Icon(CupertinoIcons.person),
                          title: Text("Theme"),
                          subtitle: Text("Change Theme"),
                          trailing: CupertinoSwitch(
                            value: false,
                            onChanged: (Value) {},
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
