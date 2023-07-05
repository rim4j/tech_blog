import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:tech_blog/common/constants/dimens.dart';
import 'package:tech_blog/common/constants/my_strings.dart';
import 'package:tech_blog/config/theme/app_colors.dart';
import 'package:tech_blog/features/article/domain/entities/article_entity.dart';

class ArticleHorizontalItem extends StatelessWidget {
  final ArticleEntity articleItem;
  final VoidCallback onTap;
  final Size size;
  final TextTheme textTheme;

  const ArticleHorizontalItem({
    Key? key,
    required this.articleItem,
    required this.onTap,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(Dimens.small),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height / 6,
              width: size.width / 3,
              //image
              child: CachedNetworkImage(
                imageUrl: articleItem.image!,
                imageBuilder: (((context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(Dimens.medium)),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover)),
                  );
                })),
                placeholder: ((context, url) => SpinKitFadingCube(
                      color: AppColors.primaryColor,
                      size: Dimens.large,
                    )),
                errorWidget: ((context, url, error) {
                  return Icon(
                    Icons.image_not_supported_outlined,
                    size: Dimens.xLarge - 14,
                    color: AppColors.greyColor,
                  );
                }),
              ),
            ),
            SizedBox(
              width: Dimens.medium,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //title
                SizedBox(
                  width: size.width / 2,
                  child: Text(
                    articleItem.title!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                SizedBox(
                  height: Dimens.medium,
                ),
                //author and views
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      articleItem.author!,
                      style: textTheme.bodySmall,
                    ),
                    SizedBox(
                      width: Dimens.medium + 4,
                    ),
                    Text(
                      articleItem.view! + MyStrings.visit,
                      style: textTheme.bodySmall,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
