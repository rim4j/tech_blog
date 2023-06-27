import 'package:flutter/material.dart';
import 'package:tech_blog/features/home/domain/entities/podcast_entity.dart';
import 'package:tech_blog/features/home/presentation/widgets/top_podcast_item.dart';

class TopPodcastList extends StatelessWidget {
  const TopPodcastList({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.topPodcasts,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final List<PodcastEntity> topPodcasts;

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
                print(topPodcastItem.id);
              },
              bodyMargin: bodyMargin,
              size: size,
              index: index,
              topPodcastItem: topPodcastItem,
            );
          })),
    );
  }
}
