import 'package:flutter/material.dart';
import 'package:tech_blog/common/bloc/bottom_nav_cubit.dart';
import 'package:tech_blog/config/theme/dark_theme.dart';
import 'package:tech_blog/config/theme/light_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_blog/features/article/presentation/bloc/article_bloc.dart';
import 'package:tech_blog/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tech_blog/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_blog/features/intro/presentation/bloc/intro_bloc.dart';
import 'package:tech_blog/features/intro/presentation/pages/splash_page.dart';

import 'config/routes/on_generate_route.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<HomeBloc>()),
        BlocProvider(create: (_) => locator<ArticleBloc>()),
        BlocProvider(create: (_) => locator<AuthBloc>()),
        BlocProvider(create: (_) => locator<IntroBloc>()),
        BlocProvider(create: (_) => BottomNavCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tech blog',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: "/",
      onGenerateRoute: OnGenerateRoute.route,
      locale: const Locale("fa"),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en", ""),
        Locale("fa", ""),
      ],
      routes: {
        "/": (context) {
          return const SplashPage();
        }
      },
    );
  }
}
