import 'package:location/location.dart';

abstract class LocationInfo{
  Future<bool> requestlocationservice();
  Future<bool> requestlocationpermission();
}
class LocationInfoimpl implements LocationInfo{
  final Location location;
  LocationInfoimpl({required this.location});
  @override
  Future<bool> requestlocationpermission() async{
          PermissionStatus permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        return permissionGranted == PermissionStatus.granted;
      }
      return permissionGranted == PermissionStatus.granted;
  }

  @override
  Future<bool> requestlocationservice() async{
          bool serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        return serviceEnabled;
      }
      return serviceEnabled;
  }
}