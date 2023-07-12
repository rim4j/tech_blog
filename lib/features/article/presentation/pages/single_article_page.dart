import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/common/constants/dimens.dart';
import 'package:tech_blog/common/constants/images.dart';
import 'package:tech_blog/common/constants/page_const.dart';
import 'package:tech_blog/common/widgets/article_item.dart';
import 'package:tech_blog/config/theme/app_colors.dart';
import 'package:tech_blog/features/article/domain/entities/article_entity.dart';
import 'package:tech_blog/features/article/domain/entities/single_article_entity.dart';
import 'package:tech_blog/features/article/presentation/bloc/article_bloc.dart';
import 'package:tech_blog/features/article/presentation/bloc/single_article_status.dart';
import 'package:tech_blog/features/article/presentation/widgets/single_page_loading.dart';
import 'package:tech_blog/features/home/domain/entities/tag_entity.dart';

class SingleArticlePage extends StatefulWidget {
  final String id;

  const SingleArticlePage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<SingleArticlePage> createState() => _SingleArticlePageState();
}

class _SingleArticlePageState extends State<SingleArticlePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ArticleBloc>(context)
        .add(LoadSingleArticleEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: BlocBuilder<ArticleBloc, ArticleState>(
        builder: (context, homeState) {
          if (homeState.singleArticleStatus is SingleArticleLoading) {
            return const SinglePageLoading();
          }

          if (homeState.singleArticleStatus is SingleArticleCompleted) {
            final SingleArticleCompleted singleArticleCompleted =
                homeState.singleArticleStatus as SingleArticleCompleted;

            SingleArticleEntity singleArticleInfo =
                singleArticleCompleted.singleArticleEntity;

            List<TagEntity> tags = singleArticleCompleted.tags;
            List<ArticleEntity> related = singleArticleCompleted.related;
            return SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        //image
                        SizedBox(
                          height: height / 3,
                          child: CachedNetworkImage(
                            memCacheWidth: 200,
                            memCacheHeight: 200,
                            imageUrl: singleArticleInfo.image!,
                            imageBuilder: ((context, imageProvider) => Image(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
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
                                  onTap: () async {
                                    // await Share.share(singleArticleController
                                    //     .articleInfoModel.value.title!);
                                  },
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
                      child: Text(
                        singleArticleInfo.title!,
                        maxLines: 2,
                        style: textTheme.titleLarge,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(Dimens.small),
                      child: Row(
                        children: [
                          Image(
                            image: Image.asset(Images.profile).image,
                            height: Dimens.xLarge - 14,
                          ),
                          SizedBox(
                            width: Dimens.medium,
                          ),
                          Text(
                            singleArticleInfo.author!,
                            style: textTheme.headlineMedium,
                          ),
                          SizedBox(
                            width: Dimens.medium,
                          ),
                          Text(
                            singleArticleInfo.createdAt!,
                            style: textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(Dimens.small),
                      child: Text(
                        singleArticleInfo.content!,
                        style: textTheme.headlineSmall,
                      ),
                    ),
                    SizedBox(
                      height: Dimens.medium + 9,
                    ),
                    //tags
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        itemCount: tags.length,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final TagEntity tagItem = tags[index];
                          return Padding(
                            padding: EdgeInsets.all(Dimens.small),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colorScheme.secondary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () {
                                BlocProvider.of<ArticleBloc>(context).add(
                                  LoadArticleListWithIdEvent(
                                    id: tagItem.id!,
                                  ),
                                );
                                Navigator.pushReplacementNamed(
                                  context,
                                  PageConst.articleListPage,
                                  arguments: tagItem.title,
                                );
                              },
                              child: Text(
                                tagItem.title!,
                                style: textTheme.displayMedium,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    //related list
                    SizedBox(
                      height: size.height / 3.5,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: related.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                          final topVisitedItem = related[index];
                          //blog item
                          return ArticleItem(
                            // bodyMargin: bodyMargin,
                            size: size,
                            articleItem: topVisitedItem,
                            textTheme: textTheme,
                            index: index,
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                context,
                                PageConst.singleArticlePage,
                                arguments: topVisitedItem.id,
                              );
                            },
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      height: Dimens.medium + 9,
                    ),
                  ],
                ),
              ),
            );
          }

          if (homeState.singleArticleStatus is SingleArticleError) {
            return const Center(
              child: Text("error"),
            );
          }

          return Container();
        },
      ),
    );
  }
}
