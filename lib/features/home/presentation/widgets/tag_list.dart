import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_blog/common/constants/dimens.dart';
import 'package:tech_blog/common/constants/page_const.dart';
import 'package:tech_blog/features/article/presentation/bloc/article_bloc.dart';
import 'package:tech_blog/features/home/domain/entities/tag_entity.dart';
import 'package:tech_blog/features/home/presentation/widgets/tag_item.dart';

class TagList extends StatelessWidget {
  final List<TagEntity> tags;
  const TagList({
    Key? key,
    required this.textTheme,
    required this.bodyMargin,
    required this.tags,
  }) : super(key: key);

  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimens.xLarge - 4,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: tags.length,
        itemBuilder: ((context, index) {
          final tag = tags[index];
          return Padding(
            padding: EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
            child: TagItem(
              onTap: () {
                BlocProvider.of<ArticleBloc>(context)
                    .add(LoadArticleListWithIdEvent(id: tag.id!));

                Navigator.pushNamed(context, PageConst.articleListPage,
                    arguments: tag.title);
              },
              tag: tag,
              textTheme: textTheme,
              index: index,
            ),
          );
        }),
      ),
    );
  }
}
