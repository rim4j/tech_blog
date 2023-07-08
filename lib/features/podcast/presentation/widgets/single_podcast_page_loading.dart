import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tech_blog/common/constants/dimens.dart';

class SinglePodcastPageLoading extends StatelessWidget {
  const SinglePodcastPageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var bodyMargin = MediaQuery.of(context).size.width / 10;

    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          child: Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: Column(
              children: [
                SizedBox(height: Dimens.medium),
                //image
                SizedBox(
                  height: height / 3,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: Dimens.medium),
                //title
                Padding(
                  padding: EdgeInsets.all(Dimens.small),
                  child: Row(
                    children: [
                      Container(
                        width: width / 3,
                        height: Dimens.large,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Dimens.xLarge),
                        ),
                      )
                    ],
                  ),
                ),

                //author
                Padding(
                  padding: EdgeInsets.all(Dimens.small),
                  child: Row(
                    children: [
                      Container(
                        width: Dimens.xLarge - 14,
                        height: Dimens.xLarge - 14,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Dimens.xLarge),
                        ),
                      ),
                      SizedBox(
                        width: Dimens.medium,
                      ),
                      Container(
                        width: 100,
                        height: Dimens.large,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Dimens.xLarge),
                        ),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(Dimens.small),
                  child: Column(
                    children: [
                      SizedBox(height: Dimens.small),
                      Container(
                        width: double.infinity,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Dimens.xLarge),
                        ),
                      ),
                      SizedBox(height: Dimens.small),
                      Container(
                        width: double.infinity,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Dimens.xLarge),
                        ),
                      ),
                      SizedBox(height: Dimens.small),
                      Container(
                        width: double.infinity,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Dimens.xLarge),
                        ),
                      ),
                      SizedBox(height: Dimens.small),
                      Container(
                        width: double.infinity,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Dimens.xLarge),
                        ),
                      ),
                      SizedBox(height: Dimens.small),
                      Container(
                        width: double.infinity,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Dimens.xLarge),
                        ),
                      ),
                      SizedBox(height: Dimens.small),
                      Container(
                        width: double.infinity,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Dimens.xLarge),
                        ),
                      ),
                      SizedBox(height: Dimens.small),
                    ],
                  ),
                ),
                SizedBox(height: Dimens.medium),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: bodyMargin),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    height: height / 10,
                    width: double.infinity,
                  ),
                ),

                SizedBox(height: Dimens.medium),
                //related
                SizedBox(
                  height: height / 4,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    primary: false,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(Dimens.small),
                        child: SizedBox(
                          width: width / 1.6,
                          height: height / 4,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(Dimens.medium),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
