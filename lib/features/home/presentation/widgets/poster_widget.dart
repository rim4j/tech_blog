import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/common/constants/dimens.dart';
import 'package:tech_blog/config/theme/app_colors.dart';
import 'package:tech_blog/features/home/domain/entities/poster_entity.dart';

class Poster extends StatelessWidget {
  final PosterEntity posterEntity;
  const Poster({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.posterEntity,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.25,
          height: size.height / 4.2,
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(Dimens.medium),
            ),
            gradient: const LinearGradient(
              colors: GradientColors.homePosterCoverGradient,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: posterEntity.image!,
            imageBuilder: ((context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(Dimens.medium)),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
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
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Text(
                posterEntity.title!,
                style: textTheme.displayLarge,
              ),
            ],
          ),
        )
      ],
    );
  }
}
