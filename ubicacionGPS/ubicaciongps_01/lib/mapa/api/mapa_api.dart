



import 'package:geolocator/geolocator.dart';


var lastPosition="";
var locationMessage = "";
var aviso = "";


class MapaApi{

MapaApi._internal();
static final MapaApi _instance = MapaApi._internal();
  static MapaApi get instance => _instance;


Future<List<String>?> getCurrentLocation() async {
    
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    
    var latitudLocal = "-38.98185";
    var longitudLocal = "-72.647665";
    var lat = position.latitude.toString();
    var long = position.longitude.toString();
    print(lastPosition);
  
    locationMessage = "Latitud: $lat \nLongitud: $long";
    if (lat.toString() != latitudLocal.toString() ||
        long.toString() != longitudLocal.toString()) {
      aviso = "No se encuentra en lugar habilitado!";
      // ignore: avoid_print
      print(aviso);
    } else {
      aviso = "se encuentra en lugar habilitado";
      // ignore: avoid_print
      print(aviso);
    }
  }

}