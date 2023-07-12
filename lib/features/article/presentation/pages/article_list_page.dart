import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_blog/common/constants/dimens.dart';
import 'package:tech_blog/common/constants/images.dart';
import 'package:tech_blog/common/constants/my_strings.dart';
import 'package:tech_blog/common/constants/page_const.dart';
import 'package:tech_blog/features/article/domain/entities/article_entity.dart';
import 'package:tech_blog/features/article/presentation/bloc/article_bloc.dart';
import 'package:tech_blog/features/article/presentation/bloc/article_list_status.dart';
import 'package:tech_blog/features/article/presentation/widgets/app_bar_article.dart';
import 'package:tech_blog/features/article/presentation/widgets/article_horizontal_item.dart';
import 'package:tech_blog/features/article/presentation/widgets/article_page_loading.dart';

class ArticleListPage extends StatelessWidget {
  final String title;
  const ArticleListPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      //!app bar
      appBar: AppBarArticle(
        colorScheme: colorScheme,
        title: title,
        backButton: () {
          Navigator.restorablePushNamedAndRemoveUntil(
            context,
            PageConst.mainWrapperPage,
            (route) => false,
          );
        },
      ),

      //!body
      body: BlocBuilder<ArticleBloc, ArticleState>(
        builder: (context, articleState) {
          final currentState = articleState.articleListStatus;
          if (currentState is ArticleListLoading) {
            return const ArticlePageLoading();
          }
          if (currentState is ArticleListCompleted) {
            final List<ArticleEntity> articleList = currentState.articleList;

            if (articleList.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      MyStrings.nothing,
                      style: textTheme.bodyLarge,
                    ),
                    SizedBox(height: Dimens.xLarge),
                    Image.asset(
                      Images.empty,
                      width: 200,
                    )
                  ],
                ),
              );
            }

            return ListView.builder(
              itemCount: articleList.length,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final articleItem = articleList[index];

                return ArticleHorizontalItem(
                  articleItem: articleItem,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      PageConst.singleArticlePage,
                      arguments: articleItem.id,
                    );
                  },
                  size: size,
                  textTheme: textTheme,
                );
              },
            );
          }
          if (currentState is ArticleListError) {
            // final error = currentState.message;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.apiError,
                    style: textTheme.bodyLarge,
                  ),
                  SizedBox(height: Dimens.xLarge),
                  Image.asset(
                    Images.empty,
                    width: 200,
                  )
                ],
              ),
            );
          }

          //!default
          return Container();
        },
      ),
    );
  }
}
