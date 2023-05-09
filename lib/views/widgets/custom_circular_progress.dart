import 'package:flutter/material.dart';
import '../../values/app_colors.dart';

class CustomCircularProgress extends StatelessWidget {
  const CustomCircularProgress({super.key});
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      width: 50,
      child: CircularProgressIndicator(
        color: AppColors.accentColor,
        strokeWidth: 2,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
