import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/news_model.dart';
import '../services/http_service.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HttpService httpService = HttpService();

  HomeBloc() : super(HomeInitialState()) {
    on<LoadNewsListEvent>((event, emit) => _fetchNews(event, emit));
  }

  void _fetchNews(LoadNewsListEvent event, Emitter<HomeState> emit) async {
    try {
      emit(HomeInitialState()); // Emit initial state
      var response = await httpService.fetchBitcoinNews();
      if (response.statusCode == 200) {
        var data = response.body;
        List<News> newsList = newsFromJson(data);
        emit(HomeLoadedState(newsList)); // Emit state with loaded news
      } else {
        throw Exception('Failed to load Bitcoin news');
      }
    } catch (e) {
      // Handle errors here
    }
  }


}
