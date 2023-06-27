import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/common/constants/dimens.dart';
import 'package:tech_blog/config/theme/app_colors.dart';
import 'package:tech_blog/features/home/domain/entities/article_entity.dart';

class TopVisitedItem extends StatelessWidget {
  const TopVisitedItem({
    super.key,
    required this.bodyMargin,
    required this.size,
    required this.topVisitedItem,
    required this.textTheme,
    required this.index,
    required this.onTap,
  });
  final VoidCallback onTap;
  final double bodyMargin;
  final int index;
  final Size size;
  final ArticleEntity topVisitedItem;
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
            Padding(
              padding: EdgeInsets.all(Dimens.small),
              child: SizedBox(
                height: size.height / 5.3,
                width: size.width / 2.4,
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: topVisitedItem.image!,
                      imageBuilder: ((context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(Dimens.medium)),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                            foregroundDecoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(Dimens.medium)),
                              gradient: const LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: GradientColors.blogPost,
                              ),
                            ),
                          )),
                      placeholder: ((context, url) => SpinKitFadingCube(
                            color: AppColors.primaryColor,
                            size: Dimens.large,
                          )),
                      errorWidget: ((context, url, error) => Icon(
                            Icons.image_not_supported_outlined,
                            size: Dimens.xLarge - 14,
                            color: AppColors.greyColor,
                          )),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            topVisitedItem.author!,
                            style: textTheme.titleMedium,
                          ),
                          Row(
                            children: [
                              Text(
                                topVisitedItem.view!,
                                style: textTheme.titleMedium,
                              ),
                              SizedBox(
                                width: Dimens.small,
                              ),
                              Icon(
                                Icons.remove_red_eye_sharp,
                                color: AppColors.lightIcon,
                                size: Dimens.medium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: size.width / 2.4,
              child: Text(
                topVisitedItem.title!,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
