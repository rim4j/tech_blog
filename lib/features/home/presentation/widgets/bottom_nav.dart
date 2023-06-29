import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tech_blog/common/bloc/bottom_nav_cubit.dart';
import 'package:tech_blog/config/theme/app_colors.dart';

class BottomNav extends StatelessWidget {
  final PageController controller;

  const BottomNav({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = 56;

    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, index) {
        return BottomAppBar(
          color: Colors.black.withOpacity(0),
          elevation: 0,
          child: Stack(
            children: [
              CustomPaint(
                size: Size(size.width, height + 6),
                painter: BottomNavCurvePainter(
                  backgroundColor: AppColors.scaffoldBg,
                ),
              ),
              Center(
                heightFactor: 0.6,
                child: FloatingActionButton(
                  backgroundColor: AppColors.primaryColor,
                  elevation: 10,
                  onPressed: () {
                    BlocProvider.of<BottomNavCubit>(context)
                        .changeSelectedIndex(2);
                    controller.jumpToPage(2);
                  },
                  child: const Icon(
                    Icons.create,
                    color: AppColors.lightIcon,
                  ),
                ),
              ),
              SizedBox(
                height: height,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NavBarIcon(
                      text: "",
                      icon: index == 0 ? Icons.home : Icons.home_outlined,
                      selected: index == 0 ? true : false,
                      onPressed: () {
                        BlocProvider.of<BottomNavCubit>(context)
                            .changeSelectedIndex(0);
                        controller.jumpToPage(0);
                      },
                      defaultColor: AppColors.greyColor,
                      selectedColor: AppColors.primaryColor,
                    ),
                    NavBarIcon(
                      text: "",
                      icon:
                          index == 1 ? Icons.bookmark : Icons.bookmark_outline,
                      selected: index == 1 ? true : false,
                      onPressed: () {
                        BlocProvider.of<BottomNavCubit>(context)
                            .changeSelectedIndex(1);
                        controller.jumpToPage(1);
                      },
                      defaultColor: AppColors.greyColor,
                      selectedColor: AppColors.primaryColor,
                    ),
                    const SizedBox(width: 56),
                    NavBarIcon(
                      text: "",
                      icon: Icons.search,
                      selected: index == 3 ? true : false,
                      onPressed: () {
                        BlocProvider.of<BottomNavCubit>(context)
                            .changeSelectedIndex(3);
                        controller.jumpToPage(3);
                      },
                      defaultColor: AppColors.greyColor,
                      selectedColor: AppColors.primaryColor,
                    ),
                    NavBarIcon(
                      text: "",
                      icon: index == 4 ? Icons.person : Icons.person_outline,
                      selected: index == 4 ? true : false,
                      onPressed: () {
                        BlocProvider.of<BottomNavCubit>(context)
                            .changeSelectedIndex(4);
                        controller.jumpToPage(4);
                      },
                      defaultColor: AppColors.greyColor,
                      selectedColor: AppColors.primaryColor,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class BottomNavCurvePainter extends CustomPainter {
  BottomNavCurvePainter(
      {this.backgroundColor = Colors.white, this.insetRadius = 38});

  Color backgroundColor;
  double insetRadius;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 12);

    double insetCurveBeginnningX = size.width / 2 - insetRadius;
    double insetCurveEndX = size.width / 2 + insetRadius;
    double transitionToInsetCurveWidth = size.width * .05;

    path.quadraticBezierTo(
      size.width * 0.20,
      0,
      insetCurveBeginnningX - transitionToInsetCurveWidth,
      0,
    );
    path.quadraticBezierTo(
      insetCurveBeginnningX,
      0,
      insetCurveBeginnningX,
      insetRadius / 2,
    );

    path.arcToPoint(Offset(insetCurveEndX, insetRadius / 2),
        radius: Radius.circular(10.0), clockwise: false);

    path.quadraticBezierTo(
        insetCurveEndX, 0, insetCurveEndX + transitionToInsetCurveWidth, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 12);
    path.lineTo(size.width, size.height + 56);
    path.lineTo(
        0,
        size.height +
            56); //+56 here extends the navbar below app bar to include extra space on some screens (iphone 11)
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class NavBarIcon extends StatelessWidget {
  const NavBarIcon(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed,
      this.selectedColor = const Color(0xffFF8527),
      this.defaultColor = Colors.black54})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final Color defaultColor;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? selectedColor : defaultColor,
          ),
        ),
      ],
    );
  }
}
