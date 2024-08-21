import 'package:attendance_app/domains/model/attendance.dart';
import 'package:attendance_app/features/common/app_colors.dart';
import 'package:attendance_app/features/common/app_text_style.dart';
import 'package:attendance_app/utils/common_extension.dart';
import 'package:flutter/material.dart';

class CardAttendance extends StatelessWidget {
  final Attendance data;
  const CardAttendance({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.neutral10, borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tanggal : ${data.checkInTime.formatDateUsingLocalization()}",
              style: AppTextStyle.body3),
          Text("Check In : ${data.checkInTime.formatTimeUsingLocalization()}",
              style: AppTextStyle.body3),
          Text("Check Out : ${data.checkOutTime.formatTimeUsingLocalization()}",
              style: AppTextStyle.body3),
        ],
      ),
    );
  }
}
