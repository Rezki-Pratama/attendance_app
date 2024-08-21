import 'package:attendance_app/features/bloc/attendance_bloc/attendance_bloc.dart';
import 'package:attendance_app/features/bloc/location_bloc/location_bloc.dart';
import 'package:attendance_app/features/common/app_router.dart';
import 'package:attendance_app/features/common/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:attendance_app/features/bloc/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:attendance_app/utils/hex_color.dart';
import 'di/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // INIT INJECTABLE GET IT
  await di.init();

  runApp(const TamplateApp());
}

class TamplateApp extends StatefulWidget {
  const TamplateApp({super.key});

  @override
  State<TamplateApp> createState() => _TamplateAppState();
}

class _TamplateAppState extends State<TamplateApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<LocationBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<AttendanceBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<BottomNavigationCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Attendance Clock App',
        locale: const Locale('id'),
        theme: ThemeData(
          primaryColor: Colors.white,
          primaryColorDark: HexColor.getColorFromHex('#3D3939'),
          fontFamily: GoogleFonts.poppins().fontFamily,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: const TextTheme(
            titleLarge: TextStyle(
                fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold),
            titleMedium: TextStyle(
                fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold),
            titleSmall: TextStyle(
                fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
            bodyLarge: TextStyle(fontSize: 15, color: Colors.black45),
          ),
        ),
        onGenerateRoute: AppRouter().generateRoute,
        initialRoute: Routes.mainRoute,
      ),
    );
  }
}
