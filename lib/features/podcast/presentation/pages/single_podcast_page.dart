import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:tech_blog/common/constants/dimens.dart';
import 'package:tech_blog/common/constants/images.dart';
import 'package:tech_blog/common/constants/my_strings.dart';
import 'package:tech_blog/config/theme/app_colors.dart';
import 'package:tech_blog/features/podcast/domain/entities/podcast_entity.dart';
import 'package:tech_blog/features/podcast/domain/entities/podcast_file_entity.dart';
import 'package:tech_blog/features/podcast/presentation/bloc/podcast_bloc.dart';
import 'package:tech_blog/features/podcast/presentation/bloc/single_podcast_status.dart';
import 'package:tech_blog/features/podcast/presentation/widgets/single_podcast_page_loading.dart';

class SinglePodcastPage extends StatefulWidget {
  final PodcastEntity podcast;
  const SinglePodcastPage({
    Key? key,
    required this.podcast,
  }) : super(key: key);

  @override
  State<SinglePodcastPage> createState() => _SinglePodcastPageState();
}

class _SinglePodcastPageState extends State<SinglePodcastPage> {
  @override
  void initState() {
    BlocProvider.of<PodcastBloc>(context)
        .add(LoadSinglePodcastEvent(id: widget.podcast.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TextTheme textTheme = Theme.of(context).textTheme;
    var bodyMargin = width / 10;

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<PodcastBloc, PodcastState>(
          builder: (context, podcastState) {
            if (podcastState.singlePodcastStatus is SinglePodcastLoading) {
              return const Center(child: SinglePodcastPageLoading());
            }

            if (podcastState.singlePodcastStatus is SinglePodcastCompleted) {
              final SinglePodcastCompleted singlePodcastCompleted =
                  podcastState.singlePodcastStatus as SinglePodcastCompleted;

              final files = singlePodcastCompleted.files;

              return Stack(
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
                                  imageUrl: widget.podcast.poster!,
                                  imageBuilder: ((context, imageProvider) =>
                                      Image(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      )),
                                  placeholder: ((context, url) =>
                                      SpinKitFadingCube(
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
                                        colors: GradientColors
                                            .singleAppBarGradient),
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
                                widget.podcast.title!,
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
                                  widget.podcast.publisher! == ""
                                      ? "ساسان صفری"
                                      : widget.podcast.publisher!,
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
                            child: files.isEmpty
                                ? const Center(
                                    child: Text(MyStrings.nothingPodcast),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: files.length,
                                    itemBuilder: (context, index) {
                                      PodcastFileEntity file = files[index];
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                ImageIcon(
                                                  Image.asset(ICONS.bluePen)
                                                      .image,
                                                  color: AppColors.seeMore,
                                                ),
                                                const SizedBox(width: 8),
                                                SizedBox(
                                                  width: width / 1.5,
                                                  child: Text(
                                                    file.title!,
                                                    style: textTheme
                                                        .headlineMedium,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text("${file.length!}:00")
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
              );
            }

            if (podcastState.singlePodcastStatus is SinglePodcastError) {
              return const Center(
                child: Text("error"),
              );
            }
            //default
            return Container();
          },
        ),
      ),
    );
  }
}
