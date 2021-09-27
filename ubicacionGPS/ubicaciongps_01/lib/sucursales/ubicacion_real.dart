// ignore: file_names
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geocoding/flutter_geocoding.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maps_toolkit/maps_toolkit.dart';
import 'package:ubicaciongps_01/mapa/api/mapa_api.dart';

var locationMessage = "";
var aviso = "";

double latitud = 0;
double longitud = 0;
double lat = 0;
double long = 0;

class UbicacionRealPage extends StatefulWidget {
  @override
  _UbicacionRealPageState createState() => _UbicacionRealPageState();
}

class _UbicacionRealPageState extends State<UbicacionRealPage> {
  String _direccionTrabajo = '';
 // String _direcionUbicacionActual = '';
  FlutterGeocode geo = FlutterGeocode();
  @override
  void initState() {
    super.initState();

    initPlatformState();
    getCurrentLocation();
   
  }
  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    lat = position.latitude;
    long = position.longitude;
  //  print(lastPosition);

    locationMessage = "Latitud: $lat \nLongitud: $long";
  }

//metodo para mostrar direcion de un lugar determinado
  Future<void> initPlatformState() async {
    String direccionTrabajo;
  //  String direcionUbicacionActual;
    direccionTrabajo = await FlutterGeocode.latlng(      
        latitud = -38.7553817, longitud = -72.6157883);    
    setState(() {
      _direccionTrabajo = direccionTrabajo;
    });

   /*  direcionUbicacionActual = await FlutterGeocode.latlng(
      //cordenadas para mostrar en
        latitud = lat, longitud = long);    
    setState(() {
      _direcionUbicacionActual = direcionUbicacionActual;
    }); */
  }


//metodo para validar si dispositivo se encuentra dentro de un lugar determinado
  void main() async {
    //ubicacion dispositivo
    final ubicacionActual = LatLng(lat, long);

//coordenadas de un lugar especifico
    final List<LatLng> coordenadas = [
      LatLng(-38.7549540616428, -72.61606025644973),
      LatLng(-38.75482173366438, -72.61554466598861),
      LatLng(-38.755681023846996, -72.61520939546797),
      LatLng(-38.755811078247824, -72.61576183610056)
    ];
    bool ubicado = false;
    bool ubicacionReal(ubicacionActual, coordenadas) {
      for (int j = 0; j <= coordenadas.length - 1; j++) {
        if (ubicacionActual == coordenadas[j]) {
          print(ubicacionActual);
          ubicado = true;
        } else {
          ubicado = false;
        }
      }
      return ubicado; // odd = inside, even = outside;
    }

    final local = PolygonUtil.containsLocation(ubicacionActual, coordenadas,
        ubicacionReal(ubicacionActual, coordenadas));
    print(local);

    if (local == true) {
      aviso = 'Lugar habilitado para iniciar sesión';
      print('Lugar habilitado para iniciar sesión');
    } else {
      aviso = 'Lugar NO habilitado para iniciar sesión!';
      print('Lugar NO habilitado para iniciar sesión');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         
        title: const Text('Página de pruebas de aplicación'),
      ),
      
      body: Container(
        // ignore: avoid_unnecessary_containers
        child: Column(children: [
          ElevatedButton(
              onPressed: () {
                initPlatformState();
                getCurrentLocation();
                main();
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
                    "Trébol : \n" + _direccionTrabajo,
                    style:
                        TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\n" + aviso,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                   Text(
                    "\nCoordenadas de tu ubicación es:",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Text("\n" + locationMessage,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                 /*  Text("\nDirección actual es: " + _direcionUbicacionActual,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )), */
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
