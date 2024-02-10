import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class HomeLogic extends GetxController {
  var totalEarned = 0.obs;
  var reward = 0.obs;
  var rating = 0.obs;

  Future startJourney() async {}
  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    double latitude = position.latitude;
    double longitude = position.longitude;

    print('Latitude: $latitude');
    print('Longitude: $longitude');
  }
}
