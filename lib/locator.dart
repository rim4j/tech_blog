import 'package:get_it/get_it.dart';
import 'package:tech_blog/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:tech_blog/features/home/data/data_sources/remote/home_remote_data_source_impl.dart';
import 'package:tech_blog/features/home/data/repositories/home_repository_impl.dart';
import 'package:tech_blog/features/home/domain/repositories/home_repository.dart';
import 'package:tech_blog/features/home/domain/usecases/get_home_items_usecase.dart';
import 'package:tech_blog/features/home/domain/usecases/get_single_article_usecase.dart';
import 'package:tech_blog/features/home/presentation/bloc/home_bloc.dart';

GetIt locator = GetIt.instance;

Future<void> setup() async {
  //data source
  locator.registerSingleton<HomeRemoteDataSource>(HomeRemoteDataSourceImpl());

  //repositories
  locator.registerSingleton<HomeRepository>(
    HomeRepositoryImpl(homeRemoteDataSource: locator()),
  );

  //useCases
  locator.registerSingleton<GetHomeItemsUseCase>(
      GetHomeItemsUseCase(homeRepository: locator()));

  locator.registerSingleton<GetSingleArticleUseCase>(
      GetSingleArticleUseCase(homeRepository: locator()));

  //state management
  locator.registerSingleton<HomeBloc>(
    HomeBloc(
      getHomeItemsUseCase: locator(),
      getSingleArticleUseCase: locator(),
    ),
  );
}
