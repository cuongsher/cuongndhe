import 'package:demo/lab4/exercise1.dart';
import 'package:demo/lab4/exercise2.dart';
import 'package:demo/lab4/exercise3.dart';
import 'package:demo/lab4/exercise4.dart';
import 'package:demo/lab4/exercise5.dart';
import 'package:flutter/material.dart';

import 'exercise4.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lab 4 - Flutter UI Fundamental')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: const Text('Exercise 1 - Core Widgets'),
                subtitle: const Text('Demo'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Exercise1(),
                    ),
                  );
                },
              ),
            ),

            Card(
              child: ListTile(
                title: const Text('Exercise 2 - Input Controls'),
                subtitle: const Text('Demo'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Exercise2(),
                    ),
                  );
                },
              ),
            ),

            Card(
              child: ListTile(
                title: const Text('Exercise 3 - Layout Demo'),
                subtitle: const Text('Demo'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Exercise3Demo(),
                    ),
                  );
                },
              ),
            ),

            Card(
              child: ListTile(
                title: const Text('Exercise 4 - App Structure & Theme'),
                subtitle: const Text('Demo'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Exercise4(),
                    ),
                  );
                },
              ),
            ),

            Card(
              child: ListTile(
                title: const Text('Exercise 5 - Common UI Fixes'),
                subtitle: const Text('Demo'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Exercise5(),
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
