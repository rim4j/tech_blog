import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/common/constants/dimens.dart';
import 'package:tech_blog/config/theme/app_colors.dart';
import 'package:tech_blog/features/podcast/domain/entities/podcast_entity.dart';

class TopPodcastItem extends StatelessWidget {
  const TopPodcastItem({
    super.key,
    required this.bodyMargin,
    required this.size,
    required this.topPodcastItem,
    required this.index,
    required this.onTap,
    required this.textTheme,
  });
  final int index;
  final double bodyMargin;
  final Size size;
  final PodcastEntity topPodcastItem;
  final VoidCallback onTap;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding:
            EdgeInsets.only(right: index == 0 ? bodyMargin : Dimens.medium),
        child: Column(
          children: [
            SizedBox(
              height: size.height / 7.5,
              width: size.width / 3.1,
              child: CachedNetworkImage(
                memCacheWidth: 200,
                memCacheHeight: 200,
                maxHeightDiskCache: 200,
                maxWidthDiskCache: 200,
                imageUrl: topPodcastItem.poster!,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16),
                    ),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      scale: 1,
                    ),
                  ),
                ),
                placeholder: ((context, url) => SpinKitFadingCube(
                      color: AppColors.primaryColor,
                      size: Dimens.large,
                    )),
                errorWidget: (context, url, error) => Icon(
                  Icons.image_not_supported_outlined,
                  size: Dimens.xLarge - 14,
                  color: AppColors.greyColor,
                ),
              ),
            ),
            SizedBox(
                width: size.width / 2.4,
                child: Padding(
                  padding: EdgeInsets.all(Dimens.small),
                  child: Center(
                    child: Text(
                      topPodcastItem.title!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: textTheme.bodyLarge,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
