// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubicaciongps_01/routes/routes.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: routes(),
      initialRoute: '/home',
    );
  }
}
