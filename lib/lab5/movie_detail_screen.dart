import 'package:demo/lab5/sample_data.dart';
import 'package:flutter/material.dart';
import 'movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailScreen extends ConsumerWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteProvider);
    final isFavorite = favorites.contains(movie.id);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  movie.posterUrl,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black54,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  bottom: 16,
                  child: Text(
                    movie.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 8,
                    children: movie.genres
                        .map((g) => Chip(label: Text(g)))
                        .toList(),
                  ),
                  const SizedBox(height: 16),
                  Text(movie.overview),
                  const SizedBox(height: 20),

                  /// ACTIONS (Riverpod controlled)
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorite
                                  ? Colors.red
                                  : null,
                            ),
                            onPressed: () {
                              ref
                                  .read(favoriteProvider.notifier)
                                  .toggleFavorite(movie.id);
                            },
                          ),
                          const Text("Favorite"),
                        ],
                      ),
                      const Column(
                        children: [
                          Icon(Icons.star_border),
                          SizedBox(height: 4),
                          Text("Rate"),
                        ],
                      ),
                      const Column(
                        children: [
                          Icon(Icons.share),
                          SizedBox(height: 4),
                          Text("Share"),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),
                  const Text("Trailers",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),

                  ...movie.trailers.map(
                        (t) => ListTile(
                      leading:
                      const Icon(Icons.play_circle_outline),
                      title: Text(t),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}