import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Ipage1 extends StatefulWidget {
  const Ipage1({super.key});

  @override
  State<Ipage1> createState() => _Ipage1State();
}

class _Ipage1State extends State<Ipage1> {
  GlobalKey<FormState> fkey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController chatcontroller = TextEditingController();
  String? xFile;
  var date;
  var time;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              children: [
                SizedBox(height: 10),
                GestureDetector(
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
                            GestureDetector(
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
                            GestureDetector(
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
                  child: CircleAvatar(
                    radius: 50,
                    child: Icon(CupertinoIcons.camera),
                  ),
                ),
                SizedBox(height: 10),
                CupertinoTextFormFieldRow(
                  textInputAction: TextInputAction.next,
                  prefix: Icon(CupertinoIcons.person),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                SizedBox(height: 10),
                CupertinoTextFormFieldRow(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  prefix: Icon(CupertinoIcons.phone),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                SizedBox(height: 10),
                CupertinoTextFormFieldRow(
                  prefix: Icon(CupertinoIcons.chat_bubble_2),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(width: 20),
                    Icon(Icons.calendar_month),
                    SizedBox(width: 10),
                    Text("Pick Date"),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(width: 20),
                    Icon(Icons.watch_later_outlined),
                    SizedBox(width: 10),
                    Text("Pick Time"),
                  ],
                ),
                CupertinoButton(
                  child: Text("Save"),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
