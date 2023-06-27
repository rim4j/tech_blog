import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tech_blog/common/constants/dimens.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var bodyMargin = MediaQuery.of(context).size.width / 10;

    return SingleChildScrollView(
      child: SizedBox(
        child: Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.white,
          child: Column(
            children: [
              SizedBox(height: Dimens.medium),
              //poster
              SizedBox(
                width: width / 1.25,
                height: height / 4.2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.medium),
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: Dimens.medium),
              //tag list
              SizedBox(
                height: Dimens.xLarge - 4,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: index == 0
                          ? EdgeInsets.only(
                              right: bodyMargin,
                              bottom: Dimens.small,
                              left: Dimens.small,
                              top: Dimens.small,
                            )
                          : EdgeInsets.all(Dimens.small),
                      child: SizedBox(
                        width: 80,
                        height: 50,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(Dimens.large),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: Dimens.large),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(right: bodyMargin),
                  child: Container(
                    width: width / 2,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimens.medium),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Dimens.medium),
              SizedBox(
                height: height / 4,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: index == 0
                          ? EdgeInsets.only(
                              right: bodyMargin,
                              bottom: Dimens.small,
                              left: Dimens.small,
                              top: Dimens.small,
                            )
                          : EdgeInsets.all(Dimens.small),
                      child: SizedBox(
                        width: width / 1.6,
                        height: height / 4,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(Dimens.medium),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: Dimens.medium),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(right: bodyMargin),
                  child: Container(
                    width: width / 2,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimens.medium),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Dimens.medium),
              SizedBox(
                height: height / 4,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: index == 0
                          ? EdgeInsets.only(
                              right: bodyMargin,
                              bottom: Dimens.small,
                              left: Dimens.small,
                              top: Dimens.small,
                            )
                          : EdgeInsets.all(Dimens.small),
                      child: SizedBox(
                        width: width / 1.6,
                        height: height / 4,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(Dimens.medium),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: height / 9),
            ],
          ),
        ),
      ),
    );
  }
}
