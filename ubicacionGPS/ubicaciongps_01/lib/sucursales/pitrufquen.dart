// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_geocoding/flutter_geocoding.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

var locationMessage = "";
var aviso = "";

double latitud=0;
  double longitud=0;
void main() {
  runApp(PitrufquenPage());
  FlutterGeocode.apikey("apikey");
}

class PitrufquenPage extends StatefulWidget {

  
  @override
  _PitrufquenPageState createState() => _PitrufquenPageState();
}

class _PitrufquenPageState extends State<PitrufquenPage> {
  String _platformVersion = 'Unknown';
  FlutterGeocode geo = new FlutterGeocode();
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    platformVersion = await FlutterGeocode.latlng(latitud=-38.98185, longitud=-72.647665);
  print(platformVersion);
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
print(latitud);
print(longitud);
    setState(() {
      _platformVersion = platformVersion;
    });
  }


  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    //print=("$position.latitude, $position.longitude");
  /*   var latitudLocal = "-38.98185";
    var longitudLocal = "-72.647665"; */
    var lat = position.latitude;
    var long = position.longitude;
    print(lastPosition);

    locationMessage = "Latitud: $lat \nLongitud: $long";
    if (lat != latitud ||
        long != longitud) {
      aviso = "No se encuentra en su lugar de trabajo!";
      // ignore: avoid_print
      print(aviso);
    } else {
      aviso = "Se encuentra en un lugar habilitado";
      // ignore: avoid_print
      print(aviso);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pitrufquén'),
      ),
      body: Container(
        // ignore: avoid_unnecessary_containers
        child: Column(children: [
          ElevatedButton(
              onPressed: () {                
                initPlatformState();
                getCurrentLocation();
              },
              child: Text("Buscar")),
          InkWell(
            onTap: () {
              print("por fin");
            },
            child: Card(
              child: Column(
                children: [
                  Text(
                    "Trébol : \n" + _platformVersion,
                    style:
                        TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                  ),
                  Text("\n"+aviso, style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,)),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
