import 'package:attendance_app/features/bloc/location_bloc/location_bloc.dart';
import 'package:attendance_app/features/common/app_colors.dart';
import 'package:attendance_app/features/common/app_text_style.dart';
import 'package:attendance_app/features/common/routes.dart';
import 'package:attendance_app/features/screens/location_screen/widget/card_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  _retrieveLocation() {
    context.read<LocationBloc>().add(RetrieveLocation());
  }

  @override
  void initState() {
    super.initState();
    _retrieveLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Location List",
            style: TextStyle(color: AppColors.yellow30)),
      ),
      body: BlocListener<LocationBloc, LocationState>(
        listener: (context, state) {
          if (state is DeleteLocationSuccess) {
            _retrieveLocation();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is CreateLocationFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is ActiveLocationSuccess) {
            _retrieveLocation();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is RetrieveLocationFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: BlocBuilder<LocationBloc, LocationState>(
          buildWhen: (prev, current) => current is! RetrieveLocationLoading,
          builder: (context, state) {
            if (state is RetrieveLocationSuccess) {
              return RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(const Duration(seconds: 1));
                  _retrieveLocation();
                },
                child: ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      return CardLocation(data: state.data[index]);
                    }),
              );
            } else if (state is RetrieveLocationLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.yellow30)));
            } else if (state is RetrieveLocationFailure) {
              return Center(
                child: Text(state.message,
                    textAlign: TextAlign.center, style: AppTextStyle.body4),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.yellow30,
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.mapRoute).then((_) {
              _retrieveLocation();
            });
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}
