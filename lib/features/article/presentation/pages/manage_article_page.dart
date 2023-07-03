import 'package:flutter/material.dart';
import 'package:tech_blog/common/constants/my_strings.dart';
import 'package:tech_blog/features/article/presentation/widgets/app_bar_article.dart';
import 'package:tech_blog/features/article/presentation/widgets/empy_widget.dart';

class ManageArticlePage extends StatelessWidget {
  const ManageArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptyWidget(message: MyStrings.articleEmpty, textTheme: textTheme),
        ],
      ),
    );
  }
}
