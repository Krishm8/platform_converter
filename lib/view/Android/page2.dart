import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/ai_provoider.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AIprovider>(
      builder: (context, value, child) {
        if (value.contactList.isEmpty) {
          return Center(child: Text("No any chats yet..."));
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
                subtitle: Text("${value.contactList[index].chat}"),
                trailing: Text(
                    "${value.contactList[index].date?.day} / ${value.contactList[index].date?.month} / ${value.contactList[index].date?.year}"),
              );
            },
          );
        }
      },
    );
  }
}
