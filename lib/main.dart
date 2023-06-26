import 'package:flutter/material.dart';
import 'package:tech_blog/common/widgets/main_wrapper.dart';
import 'package:tech_blog/config/theme/dark_theme.dart';
import 'package:tech_blog/config/theme/light_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_blog/features/home/presentation/bloc/home_bloc.dart';

import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<HomeBloc>()),
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
      home: const MainWrapper(),
    );
  }
}