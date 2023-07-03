import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_blog/common/constants/dimens.dart';
import 'package:tech_blog/common/constants/images.dart';
import 'package:tech_blog/common/constants/my_strings.dart';
import 'package:tech_blog/common/constants/page_const.dart';
import 'package:tech_blog/common/utils/get_storage.dart';
import 'package:tech_blog/features/article/domain/entities/article_entity.dart';
import 'package:tech_blog/features/article/presentation/bloc/article_bloc.dart';
import 'package:tech_blog/features/article/presentation/bloc/article_published_by_me_status.dart';
import 'package:tech_blog/features/article/presentation/widgets/app_bar_article.dart';
import 'package:tech_blog/features/article/presentation/widgets/article_horizontal_item.dart';
import 'package:tech_blog/features/article/presentation/widgets/article_page_loading.dart';
import 'package:tech_blog/features/article/presentation/widgets/empy_widget.dart';

class ManageArticlePage extends StatefulWidget {
  const ManageArticlePage({super.key});

  @override
  State<ManageArticlePage> createState() => _ManageArticlePageState();
}

class _ManageArticlePageState extends State<ManageArticlePage> {
  @override
  void initState() {
    super.initState();

    var userId = CustomGetStorage().readStorage("userId");

    userId.then((value) {
      BlocProvider.of<ArticleBloc>(context)
          .add(LoadArticlePublishedByMe(userId: value));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      //!app bar
      appBar: AppBarArticle(
        backButton: () {
          Navigator.pop(context);
        },
        title: 'مدیریت مقاله ها',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,

      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          MyStrings.textManageArticle,
          style: textTheme.displayMedium,
        ),
        onPressed: () {},
      ),
      body: BlocBuilder<ArticleBloc, ArticleState>(
        builder: (context, articleState) {
          final currentState = articleState.articlePublishedByMeStatus;

          if (currentState is ArticlePublishedByMeLoading) {
            return const ArticlePageLoading();
          }

          //success
          if (currentState is ArticlePublishedByMeCompleted) {
            final List<ArticleEntity> articlePublishedByMe =
                currentState.publishedByMe;

            if (articlePublishedByMe.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EmptyWidget(
                      message: MyStrings.articleEmpty, textTheme: textTheme),
                ],
              );
            }

            return ListView.builder(
              itemCount: articlePublishedByMe.length,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final articleItem = articlePublishedByMe[index];

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

          //!error
          if (currentState is ArticlePublishedByMeError) {
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
