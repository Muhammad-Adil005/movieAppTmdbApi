import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:movie_app/model/movie_model.dart';

import '../../api/movie_api/movie_api.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MovieApi movieApi;

  HomeBloc({required this.movieApi}) : super(const HomeState()) {
    registerEvents();
    add(CallMovieApi());
  }

  void registerEvents() {
    on<CallMovieApi>(_onCallMovieApi);
  }

  FutureOr<void> _onCallMovieApi(
      CallMovieApi event, Emitter<HomeState> emit) async {
    emit(state.copyWith(loading: true));
    try {
      final List<List<MovieModel>> responses = await Future.wait([
        movieApi.getUpcomingMovies(),
        movieApi.getPopularMovies(),
        movieApi.getTopRatedMovies(),
      ]);

      emit(state.copyWith(
        loading: false,
        upcomingMovies: responses[0],
        popularMovies: responses[1],
        topRatedMovies: responses[2],
      ));
    } catch (e) {
      emit(state.copyWith(loading: false, errorMessage: e.toString()));
    }
  }
}
