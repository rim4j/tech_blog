import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_blog/common/constants/dimens.dart';
import 'package:tech_blog/common/constants/images.dart';
import 'package:tech_blog/common/constants/my_strings.dart';
import 'package:tech_blog/common/constants/page_const.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    var height = MediaQuery.of(context).size.height;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Padding(
        padding: EdgeInsets.all(Dimens.large),
        child: Column(
          children: [
            SizedBox(
              height: height / 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  Images.tcBot,
                  height: Dimens.xLarge,
                ),
                Text(
                  MyStrings.shareKnowledge,
                  style: textTheme.bodyLarge,
                ),
              ],
            ),
            SizedBox(
              height: Dimens.large,
            ),
            Text(
              MyStrings.gigTech,
              style: textTheme.bodyLarge,
            ),
            SizedBox(
              height: Dimens.large,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: height / 9,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, PageConst.manageArticlePage);
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          ICONS.writeArticle,
                          height: Dimens.large,
                          width: Dimens.large,
                          color: colorScheme.secondary,
                        ),
                        SizedBox(
                          width: Dimens.small,
                        ),
                        Text(
                          "مدیریت مقاله ها",
                          style: textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 9,
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Image.asset(
                          ICONS.writePodcast,
                          height: Dimens.large,
                          width: Dimens.large,
                          color: colorScheme.secondary,
                        ),
                        SizedBox(
                          width: Dimens.small,
                        ),
                        Text(
                          "مدیریت پادکست ها ",
                          style: textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
