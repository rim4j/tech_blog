import 'package:flutter/material.dart';
import 'package:tech_blog/common/constants/page_const.dart';
import 'package:tech_blog/features/home/presentation/widgets/top_podcast_item.dart';
import 'package:tech_blog/features/podcast/domain/entities/podcast_entity.dart';

class TopPodcastList extends StatelessWidget {
  const TopPodcastList({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.topPodcasts,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final List<PodcastEntity> topPodcasts;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: topPodcasts.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            final topPodcastItem = topPodcasts[index];
            return TopPodcastItem(
              onTap: () {
                Navigator.pushNamed(context, PageConst.singlePodcastPage,
                    arguments: topPodcastItem);
              },
              bodyMargin: bodyMargin,
              size: size,
              index: index,
              topPodcastItem: topPodcastItem,
              textTheme: textTheme,
            );
          })),
    );
  }
}
