import 'package:equatable/equatable.dart';

import '../../model/movie_model.dart';

class HomeState extends Equatable {
  final bool loading;
  final String? errorMessage;
  final List<MovieModel> upcomingMovies;
  final List<MovieModel> popularMovies;
  final List<MovieModel> topRatedMovies;

  const HomeState({
    this.loading = false,
    this.errorMessage,
    this.upcomingMovies = const [],
    this.popularMovies = const [],
    this.topRatedMovies = const [],
  });

  HomeState copyWith({
    bool? loading,
    String? errorMessage,
    List<MovieModel>? upcomingMovies,
    List<MovieModel>? popularMovies,
    List<MovieModel>? topRatedMovies,
  }) {
    return HomeState(
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
    );
  }

  List<Object?> get props => [
        loading,
        errorMessage,
        upcomingMovies,
        popularMovies,
        topRatedMovies,
      ];
}
