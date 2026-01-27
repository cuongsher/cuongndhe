import 'package:flutter/material.dart';
class Movie {
  final String title;
  final String description;

  Movie({
    required this.title,
    required this.description,
  });
}


class Exercise3Demo extends StatefulWidget {
  const Exercise3Demo({super.key});

  @override
  State<Exercise3Demo> createState() => _Exercise3DemoState();
}

class _Exercise3DemoState extends State<Exercise3Demo> {
  final List<Movie> movies = [
    Movie(title: 'Avatar', description: 'Sample description'),
    Movie(title: 'Inception', description: 'Sample description'),
    Movie(title: 'Interstellar', description: 'Sample description'),
    Movie(title: 'Joker', description: 'Sample description'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Exercise 3 – Layout Demo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // NOW PLAYING
            const Center(
              child: Text(
                'Now Playing',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Image.asset(
              'assets/images/iu.jpg',
              width: 60,
              height: 60,
            ),


            const SizedBox(height: 16),
            // LIST
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];

                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.deepPurple.shade100,
                        child: Text(
                          movie.title[0],
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        movie.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(movie.description),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
