// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio"),
      ),
      body: Column(
        children: [
          Text("Revisar ubicación actual",
           style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height:20.0),
          ElevatedButton(
              onPressed: () {
                Get.toNamed('/mapa');
              },
              child: Text("Ingresar")
              ),
          Text("--------------------------------------",
           style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
            ),

            Text("Sucursales",
           style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height:20.0),
          ElevatedButton(
              onPressed: () {
                Get.toNamed('/temuco');
              },
              child: Text("Temuco")
              ),
               ElevatedButton(
              onPressed: () {
                Get.toNamed('/pitru');
              },
              child: Text("Pitrufquen")
              ),
               ElevatedButton(
              onPressed: () {
                Get.toNamed('/gorbea');
              },
              child: Text("Gorbea")
              ),
              ElevatedButton(
              onPressed: () {
                Get.toNamed('/ubicacionReal');
              },
              child: Text("Ubicación")
              ),
        ],
      ),
    );
  }
}
