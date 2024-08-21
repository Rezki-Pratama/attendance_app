import 'package:attendance_app/features/common/app_colors.dart';
import 'package:attendance_app/features/common/app_text_style.dart';
import 'package:flutter/material.dart';

class FlexButton extends StatelessWidget {
  final String title;
  final Color? color;
  final VoidCallback? onTap;
  const FlexButton({super.key, this.title = "", this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InkWell(
        onTap: onTap,
        child: Container(
            height: 40,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: color ?? AppColors.yellow30,
                borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Text(
                title,
                style: AppTextStyle2.bodyMedium,
              ),
            )),
      ),
    );
  }
}
