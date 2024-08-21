// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_state.dart';

enum NavbarItem { location, attendance }

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit()
      : super(const BottomNavigationState(NavbarItem.location, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.location:
        emit(const BottomNavigationState(NavbarItem.location, 0));
        break;
      case NavbarItem.attendance:
        emit(const BottomNavigationState(NavbarItem.attendance, 1));
        break;
    }
  }
}
