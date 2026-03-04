import 'package:flutter/material.dart';

class Exercise4 extends StatefulWidget {
  const Exercise4({super.key});

  @override
  State<Exercise4> createState() => _Exercise4State();
}

class _Exercise4State extends State<Exercise4> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Exercise 4 – App Structure"),
          actions: [
            Row(
              children: [
                const Text("Dark"),
                Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      isDarkMode = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: const Center(
          child: Text(
            "This is a simple screen with theme toggle.",
            style: TextStyle(fontSize: 16),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("FAB Pressed!"),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}