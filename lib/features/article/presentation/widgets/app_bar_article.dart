import 'package:flutter/material.dart';

import 'package:tech_blog/config/theme/app_colors.dart';

class AppBarArticle extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback backButton;

  const AppBarArticle({
    Key? key,
    required this.title,
    required this.backButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Center(
              child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'dana',
              fontSize: 17,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w300,
            ),
          )),
        ),
      ],
      leading: GestureDetector(
        onTap: backButton,
        child: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withBlue(100),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.keyboard_arrow_right_rounded),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
