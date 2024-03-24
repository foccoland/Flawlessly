import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flawlessly/model/news_everything_response_model.dart';
import 'package:flawlessly/repository/news_repository.dart';
import 'package:flawlessly/utils/network.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsRepository newsRepository;

  NewsBloc(this.newsRepository) : super(NewsLoading()) {
    on<LoadNewsEvent>((event, emit) async {
      emit(NewsLoading());
      Result<NewsEverythingResponse?, Error> response =
          await newsRepository.fetchNews();

      switch (response.success) {
        case null:
          emit(NewsError());
        default:
          emit(NewsSuccess(response.success!));
      }
    });
  }
}
