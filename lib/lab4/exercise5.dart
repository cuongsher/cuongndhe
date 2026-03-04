import 'package:flutter/material.dart';

class Exercise5 extends StatefulWidget {
  const Exercise5({super.key});

  @override
  State<Exercise5> createState() => _Exercise5State();
}

class _Exercise5State extends State<Exercise5> {
  int counter = 0;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercise 5 – Common UI Errors"),
      ),
      body: SingleChildScrollView( // ✅ Fix overflow
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                "Correct ListView inside Column using Expanded",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                height: 200,
                child: Column(
                  children: [
                    Expanded( // ✅ Fix ListView inside Column
                      child: ListView(
                        children: const [
                          ListTile(
                            leading: Icon(Icons.movie),
                            title: Text("Movie A"),
                          ),
                          ListTile(
                            leading: Icon(Icons.movie),
                            title: Text("Movie B"),
                          ),
                          ListTile(
                            leading: Icon(Icons.movie),
                            title: Text("Movie C"),
                          ),
                          ListTile(
                            leading: Icon(Icons.movie),
                            title: Text("Movie D"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Counter (Fix setState)",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Text("Counter value: $counter"),

              ElevatedButton(
                onPressed: () {
                  setState(() { // ✅ Fix state update
                    counter++;
                  });
                },
                child: const Text("Increase Counter"),
              ),

              const SizedBox(height: 20),

              const Text(
                "Date Picker (Fix context error)",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Text(
                selectedDate == null
                    ? "No date selected"
                    : "Selected: ${selectedDate!.toLocal()}".split(' ')[0],
              ),

              ElevatedButton(
                onPressed: () async {
                  DateTime? picked = await showDatePicker(
                    context: context, // ✅ valid context
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );

                  if (picked != null) {
                    setState(() {
                      selectedDate = picked;
                    });
                  }
                },
                child: const Text("Pick Date"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}