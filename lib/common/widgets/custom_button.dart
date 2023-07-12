import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/config/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool? loading;

  const CustomButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return ElevatedButton(
      onPressed: loading == true ? () {} : onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: loading == true
          ? const SizedBox(
              height: 50,
              child: SpinKitPulse(
                color: AppColors.lightBackColor,
                size: 20,
              ),
            )
          : Text(
              title,
              style: textTheme.titleMedium,
            ),
    );
  }
}
