import 'package:flutter/material.dart';
import 'package:tech_blog/common/constants/dimens.dart';
import 'package:tech_blog/common/constants/images.dart';

class EmptyWidget extends StatelessWidget {
  final String message;
  const EmptyWidget({
    super.key,
    required this.textTheme,
    required this.message,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Images.empty,
            height: Dimens.xLarge + 36,
          ),
          Padding(
            padding: EdgeInsets.only(top: Dimens.medium),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: message,
                style: textTheme.headlineMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
