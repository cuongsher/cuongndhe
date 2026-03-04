import 'movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Movies Provider (static data)
final moviesProvider = Provider<List<Movie>>((ref) {
  return [
    Movie(
      id: "1",
      title: "Dune: Part Two",
      posterUrl:
      "https://image.tmdb.org/t/p/w500/8b8R8l88Qje9dn9OE8PY05Nxl1X.jpg",
      overview:
      "Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators.",
      genres: ["Sci-Fi", "Adventure", "Drama"],
      rating: 8.6,
      trailers: ["Official Trailer #1", "IMAX Sneak Peek"],
    ),
    Movie(
      id: "2",
      title: "Deadpool & Wolverine",
      posterUrl:
      "https://image.tmdb.org/t/p/w500/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
      overview:
      "The multiverse gets messy when Wade Wilson teams up with Wolverine.",
      genres: ["Action", "Comedy"],
      rating: 8.3,
      trailers: ["Red Band Trailer", "Behind the Scenes"],
    ),
  ];
});

// Favorite Movies State
final favoriteProvider =
StateNotifierProvider<FavoriteNotifier, Set<String>>(
      (ref) => FavoriteNotifier(),
);

class FavoriteNotifier extends StateNotifier<Set<String>> {
  FavoriteNotifier() : super({});

  void toggleFavorite(String movieId) {
    if (state.contains(movieId)) {
      state = {...state}..remove(movieId);
    } else {
      state = {...state, movieId};
    }
  }

  bool isFavorite(String movieId) {
    return state.contains(movieId);
  }
}