import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class GetUserLocation extends StatefulWidget {
  final Function(String) onTravelTimeUpdate;

  const GetUserLocation({super.key, required this.onTravelTimeUpdate});

  @override
  State<GetUserLocation> createState() => _GetUserLocationState();
}

class _GetUserLocationState extends State<GetUserLocation> {
  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng _constantLocation = LatLng(24.863394, 67.020711);
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(24.91580, 67.093152),
    zoom: 14,
  );

  final List<Marker> _markers = <Marker>[
    Marker(
      markerId: MarkerId('constantLocation'),
      position: _constantLocation,
      infoWindow: InfoWindow(title: 'Destination'),
    ),
  ];

  Set<Polyline> _polylines = {};
  String _travelTime = '';

  Future<void> loadData() async {
    Position position = await getUserLocation();
    LatLng currentLocation = LatLng(position.latitude, position.longitude);

    final GoogleMapController controller = await _controller.future;
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('currentLocation'),
          position: currentLocation,
          infoWindow: InfoWindow(title: 'My Current Location'),
        ),
      );

      CameraPosition cameraPosition = CameraPosition(
        zoom: 14,
        target: currentLocation,
      );

      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    });

    _getRouteAndTravelTime(currentLocation, _constantLocation);
  }

  Future<Position> getUserLocation() async {
    await Geolocator.requestPermission().then((value) {
      // Permission granted
    }).onError((error, stackTrace) {
      print("Error requesting location permissions: $error");
    });

    return await Geolocator.getCurrentPosition();
  }

  Future<void> _getRouteAndTravelTime(LatLng origin, LatLng destination) async {
    const apiKey = '*****************************';
    final url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&key=$apiKey&alternatives=true&traffic_model=best_guess&departure_time=now';

    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);

    if (data['status'] == 'OK') {
      setState(() {
        _polylines.clear(); // Clear existing polylines
        for (var route in data['routes']) {
          List<LatLng> routePoints = _decodePolyline(route['overview_polyline']['points']);
          Color routeColor = _getRouteColor(route['legs'][0]['duration_in_traffic']['value']);
          _polylines.add(Polyline(
            polylineId: PolylineId(route['summary']),
            points: routePoints,
            color: routeColor,
            width: 5,
          ));
        }
        _travelTime = data['routes'][0]['legs'][0]['duration']['text'];
      });
      widget.onTravelTimeUpdate(_travelTime); // Send travel time to parent widget
    } else {
      print('Error fetching directions: ${data['status']}');
    }
  }

  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> polylineCoordinates = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      polylineCoordinates.add(LatLng((lat / 1E5).toDouble(), (lng / 1E5).toDouble()));
    }

    return polylineCoordinates;
  }

  Color _getRouteColor(int trafficDuration) {
    if (trafficDuration < 600) {
      return Colors.green;
    } else if (trafficDuration < 1800) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: _kGooglePlex,
          markers: Set<Marker>.of(_markers),
          polylines: _polylines,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: InkWell(
            onTap: () async {
              loadData();
            },
            child: const CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xFF0A1066),
              child: Icon(
                Icons.location_on,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
