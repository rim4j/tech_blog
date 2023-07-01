import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_blog/common/constants/dimens.dart';
import 'package:tech_blog/common/constants/images.dart';
import 'package:tech_blog/common/constants/my_strings.dart';
import 'package:tech_blog/common/params/verify_user_params.dart';
import 'package:tech_blog/common/utils/custom_snackbar.dart';
import 'package:tech_blog/common/widgets/custom_button.dart';
import 'package:tech_blog/common/widgets/form_container_widget.dart';
import 'package:tech_blog/config/theme/app_colors.dart';
import 'package:tech_blog/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tech_blog/features/auth/presentation/bloc/register_status.dart';
import 'package:tech_blog/features/auth/presentation/bloc/verify_user_status.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _verifyCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Images.tcBot,
              height: Dimens.xLarge + 36,
            ),
            Padding(
              padding: EdgeInsets.only(top: Dimens.medium),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: MyStrings.welcome,
                  style: textTheme.headlineMedium,
                ),
              ),
            ),
            SizedBox(
              width: size.width / 3,
              child: Padding(
                padding: EdgeInsets.only(top: Dimens.large),
                child: CustomButton(
                  onTap: () {
                    _showEmailBottomSheet(context, size, textTheme);
                  },
                  title: MyStrings.letsGo,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Future<dynamic> _showEmailBottomSheet(
    BuildContext context,
    Size size,
    TextTheme textTheme,
  ) {
    bool isValidEmail(String email) {
      if (email.isEmpty) {
        CustomSnackBars.showSnackError(context, MyStrings.enterEmail);
        return false;
      } else if (!email.endsWith("@gmail.com")) {
        CustomSnackBars.showSnackError(
            context, MyStrings.formatEmailNotCorrect);
        return false;
      } else {
        return true;
      }
    }

    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: ((context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            height: size.height / 2,
            decoration: BoxDecoration(
              color: AppColors.lightIcon,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimens.large - 2),
                topRight: Radius.circular(Dimens.large - 2),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: Dimens.small),
                Container(
                  width: size.width / 5,
                  height: 10,
                  decoration: BoxDecoration(
                    color: AppColors.greyColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(Dimens.xLarge),
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        MyStrings.insertYourEmail,
                        style: textTheme.headlineMedium,
                      ),
                      Padding(
                        padding: EdgeInsets.all(Dimens.medium + 8),
                        child: FormContainerWidget(
                          controller: _emailController,
                          hintText: MyStrings.tecEmail,
                        ),
                      ),
                      BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, authState) {
                          if (authState.registerStatus is RegisterSuccess) {
                            Navigator.pop(context);
                            _activateCodeBottomSheet(context, size, textTheme);
                          }
                        },
                        builder: (context, authState) {
                          return SizedBox(
                            width: size.width / 3,
                            child: CustomButton(
                              loading:
                                  authState.registerStatus is RegisterLoading
                                      ? true
                                      : false,
                              title: MyStrings.continuation,
                              onTap: () {
                                bool isValid =
                                    isValidEmail(_emailController.text);

                                if (isValid) {
                                  BlocProvider.of<AuthBloc>(context).add(
                                    RegisterEvent(email: _emailController.text),
                                  );
                                }
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Future<dynamic> _activateCodeBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: ((context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            height: size.height / 2,
            decoration: BoxDecoration(
              color: AppColors.lightIcon,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimens.large - 2),
                topRight: Radius.circular(Dimens.large - 2),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: Dimens.small),
                Container(
                  width: size.width / 5,
                  height: 10,
                  decoration: BoxDecoration(
                    color: AppColors.greyColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(Dimens.xLarge),
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        MyStrings.activateCode,
                        style: textTheme.headlineMedium,
                      ),
                      Padding(
                        padding: EdgeInsets.all(Dimens.medium + 8),
                        child: FormContainerWidget(
                          inputType: TextInputType.number,
                          controller: _verifyCodeController,
                          hintText: MyStrings.stars,
                        ),
                      ),
                      BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, authState) {
                          if (authState.verifyUserStatus is VerifyUserFailed) {
                            final VerifyUserFailed registerFailed =
                                authState.verifyUserStatus as VerifyUserFailed;

                            CustomSnackBars.showSnackError(
                                context, registerFailed.message);
                          }
                        },
                        builder: (context, authState) {
                          final RegisterSuccess registerSuccess =
                              authState.registerStatus as RegisterSuccess;

                          return SizedBox(
                            width: size.width / 3,
                            child: CustomButton(
                              title: MyStrings.continuation,
                              loading: authState.verifyUserStatus
                                      is VerifyUserLoading
                                  ? true
                                  : false,
                              onTap: () {
                                if (_verifyCodeController.text.isEmpty) {
                                  CustomSnackBars.showSnackError(
                                    context,
                                    MyStrings.enterVerifyCode,
                                  );
                                } else {
                                  VerifyUserParams verifyUserParams =
                                      VerifyUserParams(
                                    email: _emailController.text,
                                    userId: registerSuccess.userId,
                                    code: _verifyCodeController.text,
                                  );

                                  BlocProvider.of<AuthBloc>(context).add(
                                      VerifyUserEvent(
                                          verifyUserParams: verifyUserParams));
                                }
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
