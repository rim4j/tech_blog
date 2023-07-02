import 'package:flutter/material.dart';
import 'package:tech_blog/common/constants/my_strings.dart';
import 'package:tech_blog/common/constants/page_const.dart';
import 'package:tech_blog/common/widgets/main_wrapper.dart';
import 'package:tech_blog/config/theme/app_colors.dart';
import 'package:tech_blog/features/article/presentation/pages/article_list_page.dart';
import 'package:tech_blog/features/article/presentation/pages/single_article_page.dart';
import 'package:tech_blog/features/auth/presentation/pages/register_page.dart';

class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      // case PageConst.signIn:
      //   return routeBuilder(const SignInPage());

      // case PageConst.signUp:
      //   return routeBuilder(const SignUpPage());

      // case PageConst.forgetPassword:
      //   return routeBuilder(const ForgetPasswordPage());

      // case PageConst.createGroup:
      //   if (args is String) {
      //     return routeBuilder(CreateGroupPage(
      //       uid: args,
      //     ));
      //   } else {
      //     return routeBuilder(const NoScreenFound());
      //   }

      case PageConst.singleArticlePage:
        if (args is String) {
          return routeBuilder(SingleArticlePage(id: args));
        } else {
          return routeBuilder(const NoScreenFound());
        }

      case PageConst.articleListPage:
        if (args is String) {
          return routeBuilder(ArticleListPage(title: args));
        } else {
          return routeBuilder(const NoScreenFound());
        }

      case PageConst.mainWrapperPage:
        return routeBuilder(const MainWrapper());

      case PageConst.registerPage:
        return routeBuilder(const RegisterPage());

      default:
        return routeBuilder(const NoScreenFound());
    }
  }
}

dynamic routeBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

class NoScreenFound extends StatelessWidget {
  const NoScreenFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          MyStrings.notFound,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Center(
        child: Text(MyStrings.notFound),
      ),
    );
  }
}
