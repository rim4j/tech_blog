import 'package:get_it/get_it.dart';
import 'package:tech_blog/features/article/data/data_sources/remote/article_remote_data_source.dart';
import 'package:tech_blog/features/article/data/data_sources/remote/article_remote_data_source_impl.dart';
import 'package:tech_blog/features/article/data/repositories/article_repository_impl.dart';
import 'package:tech_blog/features/article/domain/repositories/article_repository.dart';
import 'package:tech_blog/features/article/domain/usecases/get_article_list_usecase.dart';
import 'package:tech_blog/features/article/domain/usecases/get_article_list_with_id_usecase.dart';
import 'package:tech_blog/features/article/presentation/bloc/article_bloc.dart';
import 'package:tech_blog/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:tech_blog/features/auth/data/data_sources/remote/auth_remote_data_source_impl.dart';
import 'package:tech_blog/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:tech_blog/features/auth/domain/repositories/auth_repository.dart';
import 'package:tech_blog/features/auth/domain/usecases/register_usecase.dart';
import 'package:tech_blog/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tech_blog/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:tech_blog/features/home/data/data_sources/remote/home_remote_data_source_impl.dart';
import 'package:tech_blog/features/home/data/repositories/home_repository_impl.dart';
import 'package:tech_blog/features/home/domain/repositories/home_repository.dart';
import 'package:tech_blog/features/home/domain/usecases/get_home_items_usecase.dart';
import 'package:tech_blog/features/home/presentation/bloc/home_bloc.dart';

import 'features/article/domain/usecases/get_single_article_usecase.dart';

GetIt locator = GetIt.instance;

Future<void> setup() async {
  //!data source
  locator.registerSingleton<HomeRemoteDataSource>(HomeRemoteDataSourceImpl());
  locator.registerSingleton<ArticleRemoteDataSource>(
      ArticleRemoteDataSourceImpl());

  locator.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl());

  //!repositories
  locator.registerSingleton<HomeRepository>(
    HomeRepositoryImpl(homeRemoteDataSource: locator()),
  );

  locator.registerSingleton<ArticleRepository>(
      ArticleRepositoryImpl(articleRemoteDataSource: locator()));

  locator.registerSingleton<AuthRepository>(
      AuthRepositoryImpl(authRemoteDataSource: locator()));

  //!useCases
  locator.registerSingleton<GetHomeItemsUseCase>(
      GetHomeItemsUseCase(homeRepository: locator()));

  locator.registerSingleton<GetSingleArticleUseCase>(
      GetSingleArticleUseCase(articleRepository: locator()));

  locator.registerSingleton<GetArticleListUseCase>(
      GetArticleListUseCase(articleRepository: locator()));

  locator.registerSingleton<GetArticleListWithIdUseCase>(
      GetArticleListWithIdUseCase(articleRepository: locator()));

  locator.registerSingleton<RegisterUseCase>(
      RegisterUseCase(authRepository: locator()));

  //!state management
  locator.registerSingleton<HomeBloc>(
    HomeBloc(
      getHomeItemsUseCase: locator(),
    ),
  );

  locator.registerSingleton<ArticleBloc>(
    ArticleBloc(
        getSingleArticleUseCase: locator(),
        getArticleListUseCase: locator(),
        getArticleListWithIdUseCase: locator()),
  );

  locator.registerSingleton<AuthBloc>(
    AuthBloc(
      registerUseCase: locator(),
    ),
  );
}
