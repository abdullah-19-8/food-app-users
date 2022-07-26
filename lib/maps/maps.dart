import 'package:url_launcher/url_launcher.dart';


class MapsUtils {
  MapsUtils._();

  //Latitude and longitude position params
  static Future<void> openMapWithPosition(double latitude, double longitude) async {
    final Uri googleMapUrl = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$latitude, $longitude');

    if(!await launchUrl(googleMapUrl)) throw 'Could not launch $googleMapUrl';
  }

  //Text fullAddress params
  static Future<void> openMapWithAddress(String fullAddress) async
  {
    String query = Uri.encodeComponent(fullAddress);
    final Uri googleMapUrl = Uri.parse('https://www.google.com/maps/search/?api=1&query=$query');

    if(!await launchUrl(googleMapUrl)) throw 'Could not launch $googleMapUrl';
  }
}
