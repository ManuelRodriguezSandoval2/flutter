

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ubicaciongps_01/mapa/api/mapa_api.dart';

class MapaController extends GetxController {
  List<String> _ubicacion = [];
  List<String> get ubicacion => _ubicacion;
  set ubicacion(List<String> data) {
    _ubicacion = data;
    update();
  }

  obtenerUbicacion() async {
    await MapaApi.instance.getCurrentLocation().then((data) {
      if (data != null) {
        ubicacion = data;
      //  var lat = ubicacion.position.latitude.toString();
      }
    }).catchError((error) {});
  }

 
}
