import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_blog/common/bloc/bottom_nav_cubit.dart';
import 'package:tech_blog/common/constants/images.dart';
import 'package:tech_blog/common/constants/my_strings.dart';
import 'package:tech_blog/features/article/presentation/pages/create_post_page.dart';
import 'package:tech_blog/features/auth/presentation/pages/profile_page.dart';
import 'package:tech_blog/features/home/presentation/bloc/home_bloc.dart';
import 'package:tech_blog/features/home/presentation/bloc/theme_status.dart';
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
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      key: _key,
      drawer: Drawer(
        backgroundColor: colorScheme.primary,
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
              },
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, homeState) {
                DarkMode darkMode = homeState.themeStatus as DarkMode;

                return ListTile(
                  title: Icon(
                    darkMode.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                    color: colorScheme.secondary,
                  ),
                  onTap: () {
                    BlocProvider.of<HomeBloc>(context).add(IsDarkModeEvent());
                  },
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: colorScheme.primary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: (() {
                _key.currentState!.openDrawer();
              }),
              icon: Icon(
                Icons.menu,
                color: colorScheme.secondary,
              ),
            ),
            Image.asset(
              Images.logo,
              height: height / 13.6,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: colorScheme.secondary,
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
