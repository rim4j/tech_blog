import 'package:flutter/material.dart';
import 'package:tech_blog/common/constants/page_const.dart';
import 'package:tech_blog/common/widgets/article_item.dart';

import 'package:tech_blog/features/article/domain/entities/article_entity.dart';

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
          return ArticleItem(
            bodyMargin: bodyMargin,
            size: size,
            topVisitedItem: topVisitedItem,
            textTheme: textTheme,
            index: index,
            onTap: () {
              Navigator.pushNamed(
                context,
                PageConst.singleArticlePage,
                arguments: topVisitedItem.id,
              );
            },
          );
        }),
      ),
    );
  }
}
