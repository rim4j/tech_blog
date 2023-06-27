import 'package:flutter/material.dart';

import 'package:tech_blog/features/home/domain/entities/article_entity.dart';
import 'package:tech_blog/features/home/presentation/widgets/top_visited_item.dart';

class TopVisitedList extends StatelessWidget {
  const TopVisitedList({
    Key? key,
    required this.topVisited,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final List<ArticleEntity> topVisited;
  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: topVisited.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          final topVisitedItem = topVisited[index];
          //blog item
          return TopVisitedItem(
            bodyMargin: bodyMargin,
            size: size,
            topVisitedItem: topVisitedItem,
            textTheme: textTheme,
            index: index,
            onTap: () {
              print(topVisitedItem.id);
            },
          );
        }),
      ),
    );
  }
}
