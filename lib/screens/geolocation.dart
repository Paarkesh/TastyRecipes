import 'package:flutter/material.dart';

class FourthRoute extends StatelessWidget {
  const FourthRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Geolocation",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.amber,
      ), // AppBar
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/location_bg.jpeg"),
            Text("Latitude:13.082680546213\n\nLongitutde:80.270721456623"),
          ],
        ), // ElevatedButton
      ), // Center
    ); // Scaffold
  }
}


//import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';


// class _LocationPageState extends State<FourthRoute> {
//   Position? _currentPosition;
//   String _currentAddress = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Geolocation Example'),
//         ),
//         body: Center(
//           child: _position != null
//               ? Text('Current Location: ' + _position.toString())
//               : Text('No location data'),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: _getCurrentLocation,
//           tooltip: 'Increment',
//           child: Icon(Icons.add),
//         ));
//   }

//   Position? _position;
//   void _getCurrentLocation() async {
//     Position position = await _determinePosition();
//     setState(() {
//       _position = position;
//     });
//   }

//   Future<Position> _determinePosition() async {
//     LocationPermission permission;
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Permissions are denied, next time you could try
//         // requesting permissions again (this is also where
//         // Android's shouldShowRequestPermissionRationale
//         // returned true. According to Android guidelines
//         // your App should show an explanatory UI now.
//         return Future.error('Location permissions are denied');
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are denied forever, handle appropriately.
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }
// // When we reach here, permissions are granted and we can
//     // continue accessing the position of the device.
//     return await Geolocator.getCurrentPosition();
//   }
  // _getAddressFromLatLng() async {
  //   try {
  //     List<Placemark> placemarks = await placemarkFromCoordinates(
  //         _currentPosition!.latitude, _currentPosition!.longitude);
  //     Placemark place = placemarks[0];
  //     setState(() {
  //       _currentAddress =
  //           "${place.locality}, ${place.postalCode}, ${place.country}";
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }
//}