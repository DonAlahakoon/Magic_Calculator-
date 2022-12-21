import 'package:flutter/material.dart';
import 'pages/Main.dart';
import 'pages/Contacts.dart';

void main() {
  runApp(MaterialApp(
    initialRoute:'/',

    routes:{
      '/':(context) => Main(),
      '/contact':(context) => Contacts(),
    },
  ));
}