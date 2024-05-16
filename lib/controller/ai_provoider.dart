import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_converter/modal/contact_modal.dart';

class AIprovider extends ChangeNotifier{

  bool isAndroid=Platform.isAndroid;

  void changeplatform(bool isAndroid){
    this.isAndroid=isAndroid;
    notifyListeners();
  }

  // ios CupertinoSlidingSegmentedControl
  int  sindex=1;

  // android Change page
  PageController pageController=PageController();
  int cpage=0;
  void changePage(int index){
    cpage=index;
    notifyListeners();
  }



  List<ContactData> contactList = [];

  void addContact(String name, String phone, String chat,String img,var date,var time) {
    contactList.add(ContactData(name: name,phone: phone,chat: chat,img: img,date: date,time: time));
    notifyListeners();
  }


}
