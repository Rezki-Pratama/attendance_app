import 'package:attendance_app/domains/model/attendance.dart';
import 'package:attendance_app/domains/model/location.dart';
import 'package:attendance_app/features/bloc/attendance_bloc/attendance_bloc.dart';
import 'package:attendance_app/features/bloc/location_bloc/location_bloc.dart';
import 'package:attendance_app/features/common/app_colors.dart';
import 'package:attendance_app/features/common/app_text_style.dart';
import 'package:attendance_app/features/screens/attendance_screen/widget/card_attendance.dart';
import 'package:attendance_app/features/screens/attendance_screen/widget/flex_button.dart';
import 'package:attendance_app/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
// ignore: library_prefixes
import 'package:latlong2/latlong.dart' as packageLatLng;

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  packageLatLng.LatLng? latLng;
  Location? location;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    await _getCurrentPosition();
    _retrieveAttendance();
  }

  Future<void> _retrieveAttendance() async {
    context.read<AttendanceBloc>().add(RetrieveAttendance());
  }

  Future<void> _getCurrentPosition() async {
    Position position = await _determinePosition();
    setState(() {
      latLng = packageLatLng.LatLng(position.latitude, position.longitude);
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return Future.error('Location services are disabled.');

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    return await Geolocator.getCurrentPosition();
  }

  bool _isWithinLocation() {
    if (location != null && latLng != null) {
      double distanceInMeters = Geolocator.distanceBetween(
        latLng!.latitude,
        latLng!.longitude,
        location!.latitude,
        location!.longitude,
      );
      return distanceInMeters <= 50;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Attendance List",
            style: TextStyle(color: AppColors.yellow30)),
      ),
      body: BlocListener<AttendanceBloc, AttendanceState>(
        listener: (context, state) {
          if (state is CreateAttendanceSuccess) {
            _retrieveAttendance();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is UpdateAttendanceSuccess) {
            _retrieveAttendance();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is CreateAttendanceFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is RetrieveAttendanceFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: BlocBuilder<AttendanceBloc, AttendanceState>(
          buildWhen: (prev, current) => current is! RetrieveAttendanceLoading,
          builder: (context, state) {
            if (state is RetrieveAttendanceSuccess) {
              final today = DateTime.now();
              bool isCheckedIn = state.data.any((attendance) =>
                  attendance.checkInTime.isNotEmpty &&
                  DateTime.parse(attendance.checkInTime).isSameDate(today));
              bool isCheckedOut = state.data.any((attendance) =>
                  attendance.checkOutTime.isNotEmpty &&
                  DateTime.parse(attendance.checkOutTime).isSameDate(today));

              final locationBloc = context.read<LocationBloc>();
              if (locationBloc.state is RetrieveLocationSuccess) {
                final locationState =
                    locationBloc.state as RetrieveLocationSuccess;
                if (locationState.data.isNotEmpty) {
                  location = locationState.data.firstWhere(
                    (item) => item.isActive == true,
                  );
                }
              }

              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Text(() {
                      String checkIn = "-";
                      String checkOut = "-";
                      if (state.data.isNotEmpty) {
                        checkIn = state.data[0].checkInTime
                            .formatTimeUsingLocalization();
                        checkOut = state.data[0].checkOutTime
                            .formatTimeUsingLocalization();
                      }
                      return "$checkIn - $checkOut";
                    }(), style: AppTextStyle2.bodyLarge)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlexButton(
                          onTap: () {
                            if (location != null && location!.isActive) {
                              if (_isWithinLocation()) {
                                if (!isCheckedIn) {
                                  Attendance data = Attendance(
                                      checkInTime: DateTime.now().toString(),
                                      isWithinLocation: true,
                                      timeStamps: DateTime.now().toString());
                                  context
                                      .read<AttendanceBloc>()
                                      .add(CreateAttendance(data));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Already Check In")));
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Distance of more than 50 meters from the location")));
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Please select a location first")));
                            }
                          },
                          title: "Check In",
                          color: AppColors.yellow30,
                        ),
                        const SizedBox(width: 10),
                        FlexButton(
                          onTap: () {
                            if (location != null && location!.isActive) {
                              if (_isWithinLocation()) {
                                if (!isCheckedOut) {
                                  Attendance data = Attendance(
                                      id: state.data[0].id,
                                      checkInTime: state.data[0].checkInTime,
                                      checkOutTime: DateTime.now().toString(),
                                      isWithinLocation: true,
                                      timeStamps: state.data[0].timeStamps);
                                  context
                                      .read<AttendanceBloc>()
                                      .add(UpdateAttendance(data));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Already Check Out")));
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Distance of more than 50 meters from the location")));
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Please select a location first")));
                            }
                          },
                          title: "Check Out",
                          color: AppColors.yellow30,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text("Attendance", style: AppTextStyle2.bodyLarge),
                    const SizedBox(height: 10),
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          await Future.delayed(const Duration(seconds: 1));
                          _retrieveAttendance();
                        },
                        child: ListView.builder(
                          itemCount: state.data.length,
                          itemBuilder: (context, index) {
                            return CardAttendance(data: state.data[index]);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is RetrieveAttendanceLoading) {
              return Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor)),
              );
            } else if (state is RetrieveAttendanceFailure) {
              return Center(child: Text(state.message));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
