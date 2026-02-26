import 'movie.dart';

final List<Movie> movies = [
  Movie(
    id: "1",
    title: "Inception",
    posterUrl: "https://image.tmdb.org/t/p/w500/qmDpIHrmpJINaRKAfWQfftjCdyi.jpg",
    overview:
    "A thief who steals corporate secrets through dream-sharing technology.",
    genres: ["Action", "Sci-Fi"],
    rating: 8.8,
    trailers: ["Official Trailer 1", "Official Trailer 2"],
  ),
  Movie(
    id: "2",
    title: "Interstellar",
    posterUrl: "https://image.tmdb.org/t/p/w780/rAiYTfKGqDCRIIqo664sY9XZIvQ.jpg",    overview:
    "A team of explorers travel through a wormhole in space.",
    genres: ["Adventure", "Drama"],
    rating: 8.6,
    trailers: ["Teaser", "Final Trailer"],
  ),
];