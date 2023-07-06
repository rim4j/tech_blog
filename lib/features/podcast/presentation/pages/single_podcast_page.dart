import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/common/constants/dimens.dart';
import 'package:tech_blog/common/constants/images.dart';
import 'package:tech_blog/config/theme/app_colors.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SinglePodcastPage extends StatelessWidget {
  const SinglePodcastPage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TextTheme textTheme = Theme.of(context).textTheme;
    var bodyMargin = width / 10;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        //image
                        SizedBox(
                          height: height / 3,
                          width: double.infinity,
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://rachelcorbett.com.au/wp-content/uploads/2018/07/Neon-podcast-logo.jpg",
                            imageBuilder: ((context, imageProvider) => Image(
                                  image: imageProvider,
                                  fit: BoxFit.fill,
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
                        //header
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: Dimens.xLarge,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  end: Alignment.bottomCenter,
                                  begin: Alignment.topCenter,
                                  colors: GradientColors.singleAppBarGradient),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: Dimens.medium + 4,
                                ),
                                GestureDetector(
                                  onTap: (() => Navigator.pop(context)),
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: AppColors.lightIcon,
                                    size: Dimens.medium + 8,
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                                GestureDetector(
                                  onTap: () {
                                    /// will added to your bookmark list
                                  },
                                  child: Icon(
                                    Icons.bookmark_border_rounded,
                                    color: AppColors.lightIcon,
                                    size: Dimens.medium + 8,
                                  ),
                                ),
                                SizedBox(
                                  width: Dimens.medium + 4,
                                ),
                                GestureDetector(
                                  onTap: () async {},
                                  child: Icon(
                                    Icons.share,
                                    size: Dimens.medium + 8,
                                    color: AppColors.lightIcon,
                                  ),
                                ),
                                SizedBox(
                                  width: Dimens.medium + 4,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    //title
                    Padding(
                      padding: EdgeInsets.all(Dimens.small),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "عنوان",
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          style: textTheme.titleLarge,
                        ),
                      ),
                    ),

                    //writer
                    Padding(
                      padding: EdgeInsets.all(Dimens.small),
                      child: Row(
                        children: [
                          Image.asset(
                            Images.profile,
                            height: Dimens.xLarge - 14,
                          ),
                          SizedBox(
                            width: Dimens.medium,
                          ),
                          Text(
                            "امیر جلالی",
                            style: textTheme.headlineMedium,
                          ),
                          SizedBox(
                            width: Dimens.medium,
                          )
                        ],
                      ),
                    ),

                    //file list
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ImageIcon(
                                      Image.asset(ICONS.bluePen).image,
                                      color: AppColors.seeMore,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "فریلنسر دیوانه",
                                      style: textTheme.headlineMedium,
                                    ),
                                  ],
                                ),
                                const Text("22:00")
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            //player
            Positioned(
              bottom: 8,
              left: bodyMargin,
              right: bodyMargin,
              child: Container(
                height: height / 10,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  gradient: LinearGradient(
                    colors: GradientColors.bottomNav,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LinearPercentIndicator(
                      percent: 1.0,
                      backgroundColor: AppColors.scaffoldBg,
                      progressColor: Colors.amber,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.skip_next,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.play_circle_fill,
                          size: 50,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.skip_previous,
                          color: Colors.white,
                        ),
                        SizedBox(),
                        Icon(
                          Icons.repeat,
                          color: Colors.white,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
