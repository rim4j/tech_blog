import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_blog/common/constants/dimens.dart';
import 'package:tech_blog/common/constants/images.dart';
import 'package:tech_blog/common/constants/my_strings.dart';
import 'package:tech_blog/common/constants/page_const.dart';
import 'package:tech_blog/config/theme/app_colors.dart';
import 'package:tech_blog/features/article/domain/entities/article_entity.dart';
import 'package:tech_blog/features/article/presentation/bloc/article_bloc.dart';
import 'package:tech_blog/features/article/presentation/bloc/article_list_status.dart';
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
    // var width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      //!app bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Center(
                child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'dana',
                fontSize: 17,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w300,
              ),
            )),
          ),
        ],
        leading: GestureDetector(
          onTap: () {
            Navigator.restorablePushNamedAndRemoveUntil(
              context,
              "/",
              (route) => false,
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withBlue(100),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.keyboard_arrow_right_rounded),
            ),
          ),
        ),
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
                      style: textTheme.titleSmall,
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
                    style: textTheme.titleSmall,
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
