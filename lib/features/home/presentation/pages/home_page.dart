import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_blog/features/home/domain/entities/poster_entity.dart';
import 'package:tech_blog/features/home/presentation/bloc/home_bloc.dart';
import 'package:tech_blog/features/home/presentation/bloc/home_items_status.dart';
import 'package:tech_blog/features/home/presentation/widgets/home_loading.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, homeState) {
        if (homeState.homeItemsStatus is HomeItemsLoading) {
          return const HomeLoading();
        }

        if (homeState.homeItemsStatus is HomeItemsCompleted) {
          // return const HomeLoading();
          final HomeItemsCompleted homeItemsCompleted =
              homeState.homeItemsStatus as HomeItemsCompleted;

          final PosterEntity poster = homeItemsCompleted.posterEntity;

          return Center(
            child: Text(poster.title!),
          );
        }

        if (homeState.homeItemsStatus is HomeItemsFailed) {
          final HomeItemsFailed homeItemsFailed =
              homeState.homeItemsStatus as HomeItemsFailed;

          final String errorMessage = homeItemsFailed.message;
          return Center(
            child: Text(errorMessage),
          );
        }

        return Container();
      },
    );
  }
}
