import 'package:get_it/get_it.dart';
import 'package:tech_blog/features/article/data/data_sources/remote/article_remote_data_source.dart';
import 'package:tech_blog/features/article/data/data_sources/remote/article_remote_data_source_impl.dart';
import 'package:tech_blog/features/article/data/repositories/article_repository_impl.dart';
import 'package:tech_blog/features/article/domain/repositories/article_repository.dart';
import 'package:tech_blog/features/article/domain/usecases/get_article_list_usecase.dart';
import 'package:tech_blog/features/article/domain/usecases/get_article_list_with_id_usecase.dart';
import 'package:tech_blog/features/article/domain/usecases/get_article_published_by_me_usecase.dart';
import 'package:tech_blog/features/article/presentation/bloc/article_bloc.dart';
import 'package:tech_blog/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:tech_blog/features/auth/data/data_sources/local/auth_local_data_source_impl.dart';
import 'package:tech_blog/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:tech_blog/features/auth/data/data_sources/remote/auth_remote_data_source_impl.dart';
import 'package:tech_blog/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:tech_blog/features/auth/domain/repositories/auth_repository.dart';
import 'package:tech_blog/features/auth/domain/usecases/is_auth_usecase.dart';
import 'package:tech_blog/features/auth/domain/usecases/register_usecase.dart';
import 'package:tech_blog/features/auth/domain/usecases/save_token_usecase.dart';
import 'package:tech_blog/features/auth/domain/usecases/save_user_id_usecase.dart';
import 'package:tech_blog/features/auth/domain/usecases/verify_user_usecase.dart';
import 'package:tech_blog/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tech_blog/features/home/data/data_sources/local/home_local_data_source.dart';
import 'package:tech_blog/features/home/data/data_sources/local/home_local_data_source_impl.dart';
import 'package:tech_blog/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:tech_blog/features/home/data/data_sources/remote/home_remote_data_source_impl.dart';
import 'package:tech_blog/features/home/data/repositories/home_repository_impl.dart';
import 'package:tech_blog/features/home/domain/repositories/home_repository.dart';
import 'package:tech_blog/features/home/domain/usecases/get_home_items_usecase.dart';
import 'package:tech_blog/features/home/domain/usecases/read_dark_mode_usecase.dart';
import 'package:tech_blog/features/home/domain/usecases/set_dark_mode_usecase.dart';
import 'package:tech_blog/features/home/presentation/bloc/home_bloc.dart';
import 'package:tech_blog/features/intro/data/repositories/intro_repository_impl.dart';
import 'package:tech_blog/features/intro/domain/repositories/intro_repository.dart';
import 'package:tech_blog/features/intro/domain/usecases/check_connection_usecase.dart';
import 'package:tech_blog/features/intro/presentation/bloc/intro_bloc.dart';
import 'package:tech_blog/features/podcast/data/data_sources/remote/podcast_remote_data_source.dart';
import 'package:tech_blog/features/podcast/data/data_sources/remote/podcast_remote_data_source_impl.dart';
import 'package:tech_blog/features/podcast/data/repositories/podcast_repository_impl.dart';
import 'package:tech_blog/features/podcast/domain/repositories/podcast_repository.dart';
import 'package:tech_blog/features/podcast/domain/usecases/get_single_podcast_usecase.dart';
import 'package:tech_blog/features/podcast/presentation/bloc/podcast_bloc.dart';

import 'features/article/domain/usecases/get_single_article_usecase.dart';

GetIt locator = GetIt.instance;

Future<void> setup() async {
  //!data source
  locator.registerSingleton<HomeRemoteDataSource>(HomeRemoteDataSourceImpl());
  locator.registerSingleton<ArticleRemoteDataSource>(
      ArticleRemoteDataSourceImpl());

  locator.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl());
  locator.registerSingleton<AuthLocalDataSource>(AuthLocalDataSourceImpl());
  locator.registerSingleton<PodcastRemoteDataSource>(
      PodcastRemoteDataSourceImpl());

  locator.registerSingleton<HomeLocalDataSource>(HomeLocalDataSourceImpl());

  //!repositories
  //home
  locator.registerSingleton<HomeRepository>(
    HomeRepositoryImpl(
      homeRemoteDataSource: locator(),
      homeLocalDataSource: locator(),
    ),
  );

  //article
  locator.registerSingleton<ArticleRepository>(
      ArticleRepositoryImpl(articleRemoteDataSource: locator()));

  //auth
  locator.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(
      authRemoteDataSource: locator(),
      authLocalDataSource: locator(),
    ),
  );

  //intro
  locator.registerSingleton<IntroRepository>(IntroRepositoryImpl());

  //podcast
  locator.registerSingleton<PodcastRepository>(
      PodcastRepositoryImpl(podcastRemoteDataSource: locator()));

  //!useCases
  //home
  locator.registerSingleton<GetHomeItemsUseCase>(
      GetHomeItemsUseCase(homeRepository: locator()));

  locator.registerSingleton<SetDarkModeUseCase>(
      SetDarkModeUseCase(homeRepository: locator()));
  locator.registerSingleton<ReadDarkModeUseCase>(
      ReadDarkModeUseCase(homeRepository: locator()));

  //article

  locator.registerSingleton<GetSingleArticleUseCase>(
      GetSingleArticleUseCase(articleRepository: locator()));

  locator.registerSingleton<GetArticleListUseCase>(
      GetArticleListUseCase(articleRepository: locator()));

  locator.registerSingleton<GetArticleListWithIdUseCase>(
      GetArticleListWithIdUseCase(articleRepository: locator()));

  locator.registerSingleton<GetArticlePublishedByMeUseCase>(
      GetArticlePublishedByMeUseCase(articleRepository: locator()));

  //auth

  locator.registerSingleton<RegisterUseCase>(
      RegisterUseCase(authRepository: locator()));

  locator.registerSingleton<VerifyUserUseCase>(
      VerifyUserUseCase(authRepository: locator()));

  locator.registerSingleton<SaveTokenUseCase>(
      SaveTokenUseCase(authRepository: locator()));

  locator.registerSingleton<SaveUserIdUseCase>(
      SaveUserIdUseCase(authRepository: locator()));

  locator.registerSingleton<IsAuthUseCase>(
      IsAuthUseCase(authRepository: locator()));

  //intro
  locator.registerSingleton<CheckConnectionUseCase>(
      CheckConnectionUseCase(introRepository: locator()));

  //podcast
  locator.registerSingleton<GetSinglePodcastUseCase>(
      GetSinglePodcastUseCase(podcastRepository: locator()));

  //!state management
  //home
  locator.registerSingleton<HomeBloc>(
    HomeBloc(
      getHomeItemsUseCase: locator(),
      readDarkModeUseCase: locator(),
      setDarkModeUseCase: locator(),
    ),
  );

  //article
  locator.registerSingleton<ArticleBloc>(
    ArticleBloc(
      getSingleArticleUseCase: locator(),
      getArticleListUseCase: locator(),
      getArticleListWithIdUseCase: locator(),
      getArticlePublishedByMeUseCase: locator(),
    ),
  );

  locator.registerSingleton<AuthBloc>(
    AuthBloc(
      registerUseCase: locator(),
      verifyUserUseCase: locator(),
      saveTokenUseCase: locator(),
      saveUserIdUseCase: locator(),
    ),
  );
  //intro
  locator.registerSingleton<IntroBloc>(
      IntroBloc(checkConnectionUseCase: locator()));

  //podcast
  locator.registerSingleton<PodcastBloc>(
    PodcastBloc(
      getSinglePodcastUseCase: locator(),
    ),
  );
}
