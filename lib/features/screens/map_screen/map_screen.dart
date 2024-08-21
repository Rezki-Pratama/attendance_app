// ignore_for_file: library_prefixes, prefer_const_constructors, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:attendance_app/features/bloc/location_bloc/location_bloc.dart';
import 'package:attendance_app/features/common/app_colors.dart';
import 'package:attendance_app/features/common/app_text_style.dart';
import 'package:attendance_app/features/screens/map_screen/widget/open_street_map_layer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart' as packageLatLng;
import 'package:attendance_app/domains/model/location.dart' as model;

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  packageLatLng.LatLng? latLng;
  final mapController = MapController();

  late final pickedLocation =
      ValueNotifier<packageLatLng.LatLng>(packageLatLng.LatLng(0, 0));

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  void _zoomIn() {
    final zoom = mapController.camera.zoom;
    mapController.move(mapController.camera.center, zoom + 1);
  }

  void _zoomOut() {
    final zoom = mapController.camera.zoom;
    mapController.move(mapController.camera.center, zoom - 1);
  }

  _getCurrentPosition() async {
    Position _position = await _determinePosition();
    latLng = packageLatLng.LatLng(_position.latitude, _position.longitude);
    pickedLocation.value = latLng!;
    setState(() {});
  }

  @override
  void initState() {
    _getCurrentPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationBloc, LocationState>(
      listener: (context, state) {
        if (state is CreateLocationSuccess) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            if (latLng != null) ...[
              FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  initialCenter: latLng!,
                  initialZoom: 15,
                  onMapReady: () =>
                      pickedLocation.value = mapController.camera.center,
                  onPositionChanged: (_, __) {
                    pickedLocation.value = mapController.camera.center;
                  },
                ),
                children: [
                  openStreetMapTileLayer,
                  ValueListenableBuilder<packageLatLng.LatLng>(
                    valueListenable: pickedLocation,
                    builder: (context, location, _) {
                      return MarkerLayer(
                        markers: [
                          Marker(
                            point: location,
                            child: const Icon(Icons.location_on, size: 50),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                    InkWell(
                      onTap: _zoomIn,
                      child: const Icon(Icons.zoom_in, size: 40),
                    ),
                    InkWell(
                      onTap: _zoomOut,
                      child: const Icon(Icons.zoom_out, size: 40),
                    ),
                  ],
                ),
              ),
              BlocBuilder<LocationBloc, LocationState>(
                builder: (context, stateLoading) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: () async {
                        if (stateLoading is! CreateLocationLoading) {
                          List<Placemark> placemarks =
                              await placemarkFromCoordinates(
                                  pickedLocation.value.latitude,
                                  pickedLocation.value.longitude);
                          model.Location data = model.Location(
                              name:
                                  "${placemarks.first.thoroughfare}, ${placemarks.first.locality}, ${placemarks.first.subAdministrativeArea}, ${placemarks.first.country}",
                              latitude: pickedLocation.value.latitude,
                              longitude: pickedLocation.value.longitude,
                              isActive: true);
                          context
                              .read<LocationBloc>()
                              .add(CreateLocation(data));
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: AppColors.yellow30,
                            borderRadius: BorderRadius.circular(20)),
                        width: double.infinity,
                        height: 50,
                        child: Center(
                            child: stateLoading is CreateLocationLoading
                                ? const SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: CircularProgressIndicator())
                                : const Text(
                                    "Save",
                                    style: AppTextStyle2.bodyMedium,
                                  )),
                      ),
                    ),
                  );
                },
              )
            ]
          ],
        ),
      ),
    );
  }
}
