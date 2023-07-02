import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/common/constants/dimens.dart';
import 'package:tech_blog/common/constants/images.dart';
import 'package:tech_blog/common/constants/page_const.dart';
import 'package:tech_blog/config/theme/app_colors.dart';
import 'package:tech_blog/features/auth/domain/usecases/is_auth_usecase.dart';
import 'package:tech_blog/locator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  initState() {
    var isAuth = locator<IsAuthUseCase>().call();

    Future.delayed(const Duration(seconds: 3)).then((value) {
      isAuth.then((value) {
        if (value == true) {
          Navigator.pushReplacementNamed(context, PageConst.mainWrapperPage);
        } else {
          Navigator.pushReplacementNamed(context, PageConst.registerPage);
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(Images.logo, height: Dimens.xLarge),
          SizedBox(
            height: Dimens.large,
          ),
          SpinKitFadingCube(
            color: AppColors.primaryColor,
            size: Dimens.large,
          )
        ]),
      ),
    );
  }
}
