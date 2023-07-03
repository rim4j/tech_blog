import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_blog/common/bloc/bottom_nav_cubit.dart';
import 'package:tech_blog/common/constants/images.dart';
import 'package:tech_blog/common/constants/my_strings.dart';
import 'package:tech_blog/config/theme/app_colors.dart';
import 'package:tech_blog/features/article/presentation/pages/create_post_page.dart';
import 'package:tech_blog/features/auth/presentation/pages/profile_page.dart';
import 'package:tech_blog/features/home/presentation/bloc/home_bloc.dart';
import 'package:tech_blog/features/home/presentation/pages/home_page.dart';
import 'package:tech_blog/features/home/presentation/widgets/bottom_nav.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(LoadHomeItemsEvent());
  }

  PageController pageController = PageController();

  List<Widget> get pages => [
        const HomePage(),
        Container(
          color: Colors.blue,
          child: const Center(
            child: Text("bookmark"),
          ),
        ),
        const CreatePostPage(),
        Container(
          color: Colors.red,
          child: const Center(
            child: Text("search"),
          ),
        ),
        const ProfilePage()
      ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var bodyMargin = MediaQuery.of(context).size.width / 10;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      key: _key,
      drawer: Drawer(
        backgroundColor: AppColors.scaffoldBg,
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Image.asset(
                  Images.logo,
                  scale: 3,
                ),
              ),
            ),
            ListTile(
              title: Padding(
                padding: EdgeInsets.only(right: bodyMargin),
                child: Text(
                  MyStrings.userProfile,
                  style: textTheme.headlineMedium,
                ),
              ),
              onTap: () {
                _key.currentState!.closeDrawer();
                // selectedPageIndex.value = 1;
              },
            ),
            ListTile(
              title: Padding(
                padding: EdgeInsets.only(right: bodyMargin),
                child: Text(
                  MyStrings.aboutTec,
                  style: textTheme.headlineMedium,
                ),
              ),
              onTap: () {
                _key.currentState!.closeDrawer();
              },
            ),
            ListTile(
              title: Padding(
                padding: EdgeInsets.only(right: bodyMargin),
                child: Text(
                  MyStrings.shareTec,
                  style: textTheme.headlineMedium,
                ),
              ),
              onTap: () {
                _key.currentState!.closeDrawer();

                // await Share.share(MyStrings.shareText);
              },
            ),
            ListTile(
              title: Padding(
                padding: EdgeInsets.only(right: bodyMargin),
                child: Text(
                  MyStrings.tecIngithub,
                  style: textTheme.headlineMedium,
                ),
              ),
              onTap: () {
                _key.currentState!.closeDrawer();

                // myLaunchUrl(MyStrings.techBlogGithubUrl);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: AppColors.scaffoldBg,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: (() {
                _key.currentState!.openDrawer();
              }),
              icon: const Icon(
                Icons.menu,
                color: AppColors.blackColor,
              ),
            ),
            Image.asset(
              Images.logo,
              height: height / 13.6,
            ),
            IconButton(
              onPressed: () {
                // // method to show the search bar
                // showSearch(
                //     context: context,
                //     // delegate to customize the search bar
                //     delegate: CustomSearchDelegate()
                // );
              },
              icon: const Icon(
                Icons.search,
                color: AppColors.blackColor,
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            children: pages,
            onPageChanged: (index) {
              BlocProvider.of<BottomNavCubit>(context)
                  .changeSelectedIndex(index);
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomNav(controller: pageController),
          )
        ],
      ),
    );
  }
}
