import 'package:flutter/material.dart';

class Exercise1 extends StatelessWidget {
  const Exercise1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercise 1 – Core Widgets"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Headline Text
            const Text(
              "Welcome to Flutter UI",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // Icon
            const Icon(
              Icons.movie,
              size: 60,
              color: Colors.blue,
            ),

            const SizedBox(height: 20),

            // Network Image
            Image.network(
              "https://images.unsplash.com/photo-1507525428034-b723cf961d3e",
              height: 180,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 20),

            // Card with ListTile
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const ListTile(
                leading: Icon(Icons.star),
                title: Text("Movie Item"),
                subtitle: Text(
                  "This is a sample ListTile inside a Card.",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}