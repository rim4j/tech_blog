import 'package:flutter/material.dart';
import 'package:tech_blog/common/constants/images.dart';
import 'package:tech_blog/config/theme/app_colors.dart';
import 'package:tech_blog/features/home/domain/entities/tag_entity.dart';

class MainTags extends StatelessWidget {
  final TagEntity tag;

  const MainTags({
    Key? key,
    required this.tag,
    required this.textTheme,
    required this.index,
  }) : super(key: key);

  final TextTheme textTheme;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        gradient: LinearGradient(
            colors: GradientColors.tags,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          children: [
            ImageIcon(
              Image.asset(ICONS.hashTag).image,
              color: Colors.white,
              size: 16,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              tag.title!,
              style: textTheme.displayMedium,
            )
          ],
        ),
      ),
    );
  }
}
