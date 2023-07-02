import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/common/constants/dimens.dart';
import 'package:tech_blog/common/constants/images.dart';
import 'package:tech_blog/common/constants/page_const.dart';
import 'package:tech_blog/common/utils/custom_snackbar.dart';
import 'package:tech_blog/common/widgets/custom_button.dart';

import 'package:tech_blog/config/theme/app_colors.dart';
import 'package:tech_blog/features/auth/domain/usecases/is_auth_usecase.dart';
import 'package:tech_blog/features/intro/presentation/bloc/check_connection_status.dart';
import 'package:tech_blog/features/intro/presentation/bloc/intro_bloc.dart';
import 'package:tech_blog/locator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  initState() {
    BlocProvider.of<IntroBloc>(context).add(CheckConnectionEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.logo, height: Dimens.xLarge),
            SizedBox(
              height: Dimens.large,
            ),
            SpinKitFadingCube(
              color: AppColors.primaryColor,
              size: Dimens.large,
            ),
            const SizedBox(
              height: 50,
            ),
            BlocConsumer<IntroBloc, IntroState>(
              listener: (context, introState) {
                if (introState.checkConnectionStatus is CheckConnectionOff) {
                  CheckConnectionOff checkConnectionOff =
                      introState.checkConnectionStatus as CheckConnectionOff;

                  CustomSnackBars.showSnackError(
                    context,
                    checkConnectionOff.message,
                  );
                }

                if (introState.checkConnectionStatus is CheckConnectionOn) {
                  var isAuth = locator<IsAuthUseCase>().call();

                  Future.delayed(const Duration(seconds: 3)).then((value) {
                    isAuth.then((value) {
                      if (value == true) {
                        Navigator.pushReplacementNamed(
                            context, PageConst.mainWrapperPage);
                      } else {
                        Navigator.pushReplacementNamed(
                            context, PageConst.registerPage);
                      }
                    });
                  });
                }
              },
              builder: (context, introState) {
                if (introState.checkConnectionStatus is CheckConnectionOff) {
                  return SizedBox(
                    width: 200,
                    child: CustomButton(
                      title: "تلاش دوباره",
                      onTap: () {
                        BlocProvider.of<IntroBloc>(context)
                            .add(CheckConnectionEvent());
                      },
                    ),
                  );
                }

                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
