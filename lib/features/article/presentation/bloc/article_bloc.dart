import 'package:bloc/bloc.dart';
import 'package:tech_blog/common/resources/data_state.dart';
import 'package:tech_blog/features/article/domain/usecases/get_article_list_usecase.dart';
import 'package:tech_blog/features/article/domain/usecases/get_article_list_with_id_usecase.dart';
import 'package:tech_blog/features/article/domain/usecases/get_single_article_usecase.dart';
import 'package:tech_blog/features/article/presentation/bloc/article_list_status.dart';
import 'package:tech_blog/features/article/presentation/bloc/single_article_status.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  GetSingleArticleUseCase getSingleArticleUseCase;
  GetArticleListUseCase getArticleListUseCase;
  GetArticleListWithIdUseCase getArticleListWithIdUseCase;

  ArticleBloc({
    required this.getSingleArticleUseCase,
    required this.getArticleListUseCase,
    required this.getArticleListWithIdUseCase,
  }) : super(
          ArticleState(
              singleArticleStatus: SingleArticleLoading(),
              articleListStatus: ArticleListLoading()),
        ) {
    on<LoadSingleArticleEvent>(_onLoadSingleArticleEvent);
    on<LoadArticleListEvent>(_onLoadArticleListEvent);
    on<LoadArticleListWithIdEvent>(_onLoadArticleListWithIdEvent);
  }

  void _onLoadSingleArticleEvent(
    LoadSingleArticleEvent event,
    Emitter<ArticleState> emit,
  ) async {
    emit(state.copyWith(newSingleArticleStatus: SingleArticleLoading()));
    DataState dataState = await getSingleArticleUseCase(event.id);

    if (dataState is DataSuccess) {
      emit(
        state.copyWith(
          newSingleArticleStatus: SingleArticleCompleted(
            singleArticleEntity: dataState.data["info"],
            related: dataState.data["related"],
            tags: dataState.data["tags"],
          ),
        ),
      );
    }

    if (dataState is DataFailed) {
      emit(state.copyWith(
          newSingleArticleStatus: SingleArticleError(dataState.error!)));
    }
  }

  void _onLoadArticleListEvent(
    LoadArticleListEvent event,
    Emitter<ArticleState> emit,
  ) async {
    emit(state.copyWith(newArticleListStatus: ArticleListLoading()));
    DataState dataState = await getArticleListUseCase();

    if (dataState is DataSuccess) {
      emit(
        state.copyWith(
          newArticleListStatus:
              ArticleListCompleted(articleList: dataState.data),
        ),
      );
    }

    if (dataState is DataFailed) {
      emit(
        state.copyWith(
            newArticleListStatus: ArticleListError(dataState.error!)),
      );
    }
  }

  void _onLoadArticleListWithIdEvent(
    LoadArticleListWithIdEvent event,
    Emitter<ArticleState> emit,
  ) async {
    emit(state.copyWith(newArticleListStatus: ArticleListLoading()));
    DataState dataState = await getArticleListWithIdUseCase(event.id);

    if (dataState is DataSuccess) {
      emit(
        state.copyWith(
          newArticleListStatus:
              ArticleListCompleted(articleList: dataState.data),
        ),
      );
    }

    if (dataState is DataFailed) {
      emit(
        state.copyWith(
            newArticleListStatus: ArticleListError(dataState.error!)),
      );
    }
  }
}
