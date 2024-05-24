import 'package:equatable/equatable.dart';

import '../models/news_model.dart';

abstract class HomeState extends Equatable {}

class HomeInitialState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}
class HomeLoadedState extends HomeState {
  final List<News> newsList;

  HomeLoadedState(this.newsList);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeErrorState extends HomeState {
  final String errorMessage;

  HomeErrorState(this.errorMessage);

  @override
  List<Object> get props => [];
}

