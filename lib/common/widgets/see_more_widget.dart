import 'package:flutter/material.dart';
import 'package:tech_blog/config/theme/app_colors.dart';

class SeeMore extends StatelessWidget {
  const SeeMore({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
    required this.title,
    required this.iconImage,
    required this.onTap,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;
  final String title;
  final String iconImage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
        child: Row(
          children: [
            ImageIcon(
              Image.asset(iconImage).image,
              color: AppColors.seeMore,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: textTheme.displaySmall,
            )
          ],
        ),
      ),
    );
  }
}
