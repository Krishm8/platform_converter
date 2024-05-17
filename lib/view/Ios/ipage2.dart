import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/controller/ai_provoider.dart';
import 'package:provider/provider.dart';

class Ipage2 extends StatefulWidget {
  const Ipage2({super.key});

  @override
  State<Ipage2> createState() => _Ipage2State();
}

class _Ipage2State extends State<Ipage2> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Consumer<AIprovider>(
              builder: (context, value, child) {
                if (value.contactList.isEmpty) {
                  return Center(child: Text("No any chats yet..."));
                } else {
                  return ListView.builder(
                    itemCount: value.contactList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: FileImage(
                              File(value.contactList[index].img.toString())),
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
            ),
          ),
        ],
      ),
    );
  }
}
