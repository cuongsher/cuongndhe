import 'package:flutter/material.dart';
import 'movie.dart';
import 'sample_data.dart';
import 'movie_detail_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(moviesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Movies")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  movie.posterUrl,
                  width: 60,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(movie.title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(
                  "⭐ ${movie.rating} • ${movie.genres.join(", ")}"),
              trailing:
              const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MovieDetailScreen(movie: movie),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}