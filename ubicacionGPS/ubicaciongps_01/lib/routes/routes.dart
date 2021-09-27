
import 'package:get/route_manager.dart';
import 'package:ubicaciongps_01/home/home_page.dart';
import 'package:ubicaciongps_01/mapa/mapa_page.dart';
import 'package:ubicaciongps_01/sucursales/gorbea.dart';
import 'package:ubicaciongps_01/sucursales/pitrufquen.dart';
import 'package:ubicaciongps_01/sucursales/temuco.dart';
import 'package:ubicaciongps_01/sucursales/ubicacion_real.dart';



routes() => [
      //Rutas generales
      GetPage(
        name: '/home',
        page: () => HomePage(),
      ),
      GetPage(
        name: '/mapa',
        page: () => MapaPage(),
      ),
      GetPage(
        name: '/gorbea',
        page: () => GorbeaPage(),
      ),
      GetPage(
        name: '/pitru',
        page: () => PitrufquenPage(),
      ),
      GetPage(
        name: '/temuco',
        page: () => TemucoPage(),
      ),
      GetPage(
        name: '/ubicacionReal',
        page: () => UbicacionRealPage(),
      ),
      
    ];
