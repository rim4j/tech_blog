import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tech_blog/common/constants/dimens.dart';

class ArticlePageLoading extends StatelessWidget {
  const ArticlePageLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(height: Dimens.medium),
                //image
                Padding(
                  padding: EdgeInsets.only(
                    bottom: index == 10 ? 100 : Dimens.small,
                    left: Dimens.small,
                    right: Dimens.small,
                    top: Dimens.small,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: height / 6,
                        width: width / 3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(Dimens.medium)),
                        ),
                      ),
                      SizedBox(
                        width: Dimens.medium,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //title
                          Container(
                            width: width / 2,
                            height: Dimens.xLarge,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(Dimens.medium)),
                            ),
                          ),
                          SizedBox(
                            height: Dimens.medium,
                          ),
                          //author and views
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: width / 8,
                                height: Dimens.medium,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Dimens.medium)),
                                ),
                              ),
                              SizedBox(
                                width: Dimens.medium + 4,
                              ),
                              Container(
                                width: width / 8,
                                height: Dimens.medium,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Dimens.medium)),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
