import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_blog/common/constants/dimens.dart';
import 'package:tech_blog/common/constants/images.dart';
import 'package:tech_blog/common/constants/my_strings.dart';
import 'package:tech_blog/common/constants/page_const.dart';
import 'package:tech_blog/config/theme/app_colors.dart';
import 'package:tech_blog/features/article/domain/entities/article_entity.dart';
import 'package:tech_blog/features/article/presentation/bloc/article_bloc.dart';
import 'package:tech_blog/features/home/domain/entities/podcast_entity.dart';
import 'package:tech_blog/features/home/domain/entities/poster_entity.dart';
import 'package:tech_blog/features/home/domain/entities/tag_entity.dart';
import 'package:tech_blog/features/home/presentation/bloc/home_bloc.dart';
import 'package:tech_blog/features/home/presentation/bloc/home_items_status.dart';
import 'package:tech_blog/features/home/presentation/widgets/home_loading.dart';
import 'package:tech_blog/features/home/presentation/widgets/poster_widget.dart';
import 'package:tech_blog/features/home/presentation/widgets/see_more_widget.dart';
import 'package:tech_blog/features/home/presentation/widgets/tag_list.dart';
import 'package:tech_blog/features/home/presentation/widgets/top_podcast_list.dart';
import 'package:tech_blog/features/home/presentation/widgets/top_visited_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    var bodyMargin = MediaQuery.of(context).size.width / 10;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, homeState) {
        //!loading
        if (homeState.homeItemsStatus is HomeItemsLoading) {
          return const HomeLoading();
        }
        //!completed
        if (homeState.homeItemsStatus is HomeItemsCompleted) {
          final HomeItemsCompleted homeItemsCompleted =
              homeState.homeItemsStatus as HomeItemsCompleted;

          final PosterEntity poster = homeItemsCompleted.posterEntity;
          final List<TagEntity> tags = homeItemsCompleted.tags;
          final List<ArticleEntity> topVisited = homeItemsCompleted.topVisited;
          final List<PodcastEntity> topPodcasts =
              homeItemsCompleted.topPodcasts;

          return RefreshIndicator(
            backgroundColor: AppColors.primaryColor,
            color: AppColors.scaffoldBg,
            onRefresh: () async {
              BlocProvider.of<HomeBloc>(context).add(LoadHomeItemsEvent());
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: Dimens.medium),
                  Poster(
                      size: size, textTheme: textTheme, posterEntity: poster),
                  SizedBox(height: Dimens.medium),
                  TagList(
                    textTheme: textTheme,
                    bodyMargin: bodyMargin,
                    tags: tags,
                  ),
                  SizedBox(height: Dimens.large),
                  SeeMore(
                    onTap: () {
                      //request api new article
                      BlocProvider.of<ArticleBloc>(context)
                          .add(LoadArticleListEvent());

                      Navigator.pushNamed(
                        context,
                        PageConst.articleListPage,
                        arguments: "مقالات جدید",
                      );
                    },
                    bodyMargin: bodyMargin,
                    textTheme: textTheme,
                    title: MyStrings.viewHottestBlog,
                    iconImage: ICONS.bluePen,
                  ),
                  TopVisitedList(
                    topVisited: topVisited,
                    size: size,
                    bodyMargin: bodyMargin,
                    textTheme: textTheme,
                  ),
                  SeeMore(
                    onTap: () {},
                    bodyMargin: bodyMargin,
                    textTheme: textTheme,
                    title: MyStrings.viewHottestPodCasts,
                    iconImage: ICONS.mic,
                  ),
                  TopPodcastList(
                    size: size,
                    bodyMargin: bodyMargin,
                    topPodcasts: topPodcasts,
                  ),
                  SizedBox(height: Dimens.large),
                ],
              ),
            ),
          );
        }

        //!error
        if (homeState.homeItemsStatus is HomeItemsFailed) {
          final HomeItemsFailed homeItemsFailed =
              homeState.homeItemsStatus as HomeItemsFailed;

          final String errorMessage = homeItemsFailed.message;
          return Center(
            child: Text(errorMessage),
          );
        }

        return Container();
      },
    );
  }
}
