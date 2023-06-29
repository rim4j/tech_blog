import 'package:bloc/bloc.dart';
import 'package:tech_blog/common/resources/data_state.dart';
import 'package:tech_blog/features/article/domain/usecases/get_single_article_usecase.dart';
import 'package:tech_blog/features/article/presentation/bloc/single_article_status.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  GetSingleArticleUseCase getSingleArticleUseCase;

  ArticleBloc({
    required this.getSingleArticleUseCase,
  }) : super(ArticleState(singleArticleStatus: SingleArticleLoading())) {
    on<LoadSingleArticleEvent>(_onLoadSingleArticleEvent);
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
}