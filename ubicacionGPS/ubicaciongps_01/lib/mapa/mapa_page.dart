// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// ignore: unused_import
import 'package:get/get.dart';

var locationMessage = "";
var aviso = "";

// ignore: use_key_in_widget_constructors, must_be_immutable
class MapaPage extends  StatefulWidget {

  
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  
  @override
  void initState() {
    super.initState();
   getCurrentLocation();
  }  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapa"),
      ),
      body: Center(
        child: Column(children: [
            // ignore: prefer_const_constructors
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: () {
                getCurrentLocation();
              },
              child: Text("Pulse aqui para obtener ubicación de actual",
                  style: TextStyle(color: Colors.white)),
            ),
             Icon(Icons.location_on, size: 50, color: Colors.red),
            SizedBox(height: 10.0),
            Text(
              "Obtener localización",
              style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0), 

            

            InkWell(
              onTap: () {
              print("por fin");
            },
              child: Card(
              child: Column(
                children: [
                  Text(
                    "\nUbicación Actual:\n ",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    locationMessage,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Text(


                    ("\n"+aviso),

                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            ),],
        ),
      ),
    );
  }

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    //print=("$position.latitude, $position.longitude");
    var latitudLocal = "-38.98185";
    var longitudLocal = "-72.647665";
    var lat = position.latitude.toString();
    var long = position.longitude.toString();
    print(lastPosition);

    locationMessage = "Latitud: $lat \nLongitud: $long";
    if (lat.toString() != latitudLocal.toString() ||
        long.toString() != longitudLocal.toString()) {
     // aviso = "No se encuentra en lugar habilitado!";
      // ignore: avoid_print
      print(aviso);
    } else {
   //   aviso = "Rio Tolten 804, Pitrufquén, Araucanía, Chile";
      // ignore: avoid_print
      print(aviso);
    }
  }
}
