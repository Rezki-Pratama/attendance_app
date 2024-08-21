import 'package:attendance_app/features/common/app_colors.dart';
import 'package:attendance_app/features/screens/attendance_screen/attendance_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:attendance_app/features/bloc/bottom_navigation_cubit/bottom_navigation_cubit.dart';

import '../location_screen/location_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      bottomNavigationBar:
          BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.red50,
            backgroundColor: AppColors.yellow30,
            unselectedItemColor: Colors.white,
            currentIndex: state.index,
            selectedLabelStyle: const TextStyle(color: AppColors.red50),
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.punch_clock_rounded,
                      color: Theme.of(context).primaryColor),
                  label: "Location"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.punch_clock_rounded,
                      color: Theme.of(context).primaryColor),
                  label: "Attendance"),
            ],
            onTap: (index) {
              if (index == 0) {
                BlocProvider.of<BottomNavigationCubit>(context)
                    .getNavBarItem(NavbarItem.location);
              } else if (index == 1) {
                BlocProvider.of<BottomNavigationCubit>(context)
                    .getNavBarItem(NavbarItem.attendance);
              }
            },
          );
        },
      ),
      body: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
          builder: (context, state) {
        if (state.navbarItem == NavbarItem.location) {
          return const LocationScreen();
        } else if (state.navbarItem == NavbarItem.attendance) {
          return const AttendanceScreen();
        }
        return Container();
      }),
    );
  }
}
