import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/movie_api/movie_api.dart';
import 'home_bloc.dart';
import 'home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(movieApi: MovieApi()),
      child: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          title: const Text("Show All Movies"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.search_rounded)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          ],
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Stack(
              children: [
                if (state.upcomingMovies.isNotEmpty ||
                    state.popularMovies.isNotEmpty ||
                    state.topRatedMovies.isNotEmpty)
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (state.upcomingMovies.isNotEmpty) ...[
                            const Text(
                              'Upcoming',
                              style: TextStyle(color: Colors.white),
                            ),
                            CarouselSlider.builder(
                              itemCount: state.upcomingMovies.length,
                              itemBuilder: (context, index, movieIndex) {
                                final movie = state.upcomingMovies[index];
                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Image.network(
                                    "https://image.tmdb.org/t/p/original/${movie.backDropPath}",
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                              options: CarouselOptions(
                                autoPlay: true,
                                enlargeCenterPage: true,
                                aspectRatio: 1.4,
                                autoPlayInterval: const Duration(seconds: 3),
                              ),
                            ),
                          ],
                          const SizedBox(height: 20),
                          if (state.popularMovies.isNotEmpty) ...[
                            const Text(
                              'Popular',
                              style: TextStyle(color: Colors.white),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              height: 200,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.popularMovies.length,
                                itemBuilder: (context, index) {
                                  final movie = state.popularMovies[index];
                                  return Container(
                                    width: 150,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        "https://image.tmdb.org/t/p/original/${movie.backDropPath}",
                                        height: 120,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                          const SizedBox(height: 20),
                          if (state.topRatedMovies.isNotEmpty) ...[
                            const Text(
                              'Top Rated',
                              style: TextStyle(color: Colors.white),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              height: 200,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.topRatedMovies.length,
                                itemBuilder: (context, index) {
                                  final movie = state.topRatedMovies[index];
                                  return Container(
                                    width: 150,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        "https://image.tmdb.org/t/p/original/${movie.backDropPath}",
                                        height: 120,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                if (state.loading)
                  const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                if (state.errorMessage != null)
                  Center(
                    child: Text(
                      state.errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
