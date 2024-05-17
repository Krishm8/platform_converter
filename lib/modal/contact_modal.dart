import 'package:flutter/material.dart';

class ContactData {
  String? name;
  String? phone;
  String? chat;
  String? img;
  DateTime? date;
  TimeOfDay? time;

  ContactData(
      {this.name, this.phone, this.chat, this.img, this.date, this.time});
}
