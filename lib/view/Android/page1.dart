import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_converter/controller/ai_provoider.dart';
import 'package:provider/provider.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  GlobalKey<FormState> fkey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController chatcontroller = TextEditingController();
  String? xFile;
  var date;
  var time;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: fkey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black12,
              backgroundImage: FileImage(File(xFile ?? "")),
              child: Center(
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            'Add Image',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          actions: [
                            InkWell(
                              onTap: () async {
                                XFile? file = await ImagePicker()
                                    .pickImage(source: ImageSource.gallery);
                                if (file != null) {
                                  setState(() {
                                    xFile = file.path;
                                  });
                                }
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Gallery",
                              ),
                            ),
                            SizedBox(width: 5),
                            InkWell(
                              onTap: () async {
                                XFile? file = await ImagePicker()
                                    .pickImage(source: ImageSource.camera);

                                xFile = file?.path;
                                setState(() {});
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Camera",
                              ),
                            ),
                          ],
                        );
                      },
                    );
                    setState(() {});
                  },
                  child: Icon(Icons.camera_alt),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              controller: namecontroller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: "Full Name",
                labelText: "Full Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter Full Name";
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              controller: phonecontroller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.call),
                hintText: "Phone number",
                labelText: "Phone Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter Phone Number";
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: chatcontroller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.chat),
                hintText: "Chat Conversation",
                labelText: "Chat Conversation",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 10,),
              InkWell(
                onTap: () async {
                  date = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2050),
                  );
                },
                child: Icon(Icons.calendar_month),
              ),
              SizedBox(width: 10,),
              Text("Pick date"),

            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(height: 10,),
              InkWell(
                onTap: () async {
                  time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                },
                child: Icon(Icons.watch_later_outlined),
              ),
              SizedBox(height: 10,),
              Text("Pick timme"),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              bool valid = fkey.currentState?.validate() ?? false;
              if (valid)
                Provider.of<AIprovider>(context, listen: false).addContact(
                    namecontroller.text,
                    phonecontroller.text,
                    chatcontroller.text,
                    xFile ?? "",
                    date,
                    time);
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }
}
