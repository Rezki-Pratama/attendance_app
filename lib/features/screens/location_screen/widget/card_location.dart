import 'package:attendance_app/features/bloc/location_bloc/location_bloc.dart';
import 'package:attendance_app/features/common/app_colors.dart';
import 'package:attendance_app/features/common/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:attendance_app/domains/model/location.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardLocation extends StatelessWidget {
  final Location data;
  const CardLocation({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Location location = Location(
          id: data.id,
          name: data.name,
          latitude: data.latitude,
          longitude: data.longitude,
          isActive: data.isActive,
        );
        context.read<LocationBloc>().add(ActiveLocation(data: location));
      },
      child: Container(
        decoration: BoxDecoration(
            color: data.isActive ? AppColors.red30 : AppColors.neutral10,
            borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.name, style: AppTextStyle.body3),
                  Text("latitude : ${data.latitude}",
                      style: AppTextStyle.body4),
                  Text("longitude : ${data.longitude}",
                      style: AppTextStyle.body4),
                ],
              ),
            ),
            InkWell(
                onTap: () {
                  Location location = Location(
                      id: data.id,
                      name: data.name,
                      latitude: data.latitude,
                      longitude: data.longitude,
                      isActive: data.isActive);
                  context
                      .read<LocationBloc>()
                      .add(DeleteLocation(data: location));
                },
                child: const Icon(
                  Icons.delete,
                  size: 30,
                ))
          ],
        ),
      ),
    );
  }
}
