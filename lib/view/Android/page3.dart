import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_converter/controller/ai_provoider.dart';
import 'package:provider/provider.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AIprovider>(
      builder: (context, value, child) {
        if (value.contactList.isEmpty) {
          return Center(child: Text("No any calls yet..."));
        } else {
          return ListView.builder(
            itemCount: value.contactList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      FileImage(File(value.contactList[index].img.toString())),
                ),
                title: Text("${value.contactList[index].name}"),
                subtitle: Text("${value.contactList[index].phone}"),
                trailing: Icon(Icons.call),
              );
            },
          );
        }
      },
    );
  }
}
