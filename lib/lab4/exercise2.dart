import 'package:flutter/material.dart';

class Exercise2 extends StatefulWidget {
  const Exercise2({super.key});

  @override
  State<Exercise2> createState() => _InputControlsDemoState();
}
class _InputControlsDemoState extends State<Exercise2> {
  double volume = 50;
  bool isOn = false;
  String TypeOfMovie = 'None';
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Excerise 2 Input Control')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rating Slider kéo thả
            Text('Rating Slider',
              textScaleFactor: 2.4,
              textAlign: TextAlign.start,
            ),
            Slider(
              value: volume,
              min: 0,
              max: 100,
              onChanged: (value) {
                setState(() => volume = value);
              },
            ),
            Text('Current Value: ${volume.toInt()}', textAlign: TextAlign.left),

            Text('Active Switch',
              textScaleFactor: 2.4,
              textAlign: TextAlign.start,
            ),
            Row(
              children: [
                Text('Is movie Active'),
                Switch(
                  value: isOn,
                  onChanged: (value) {
                    setState(() => isOn = value);
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            // RadioListTitle ấn chọn
            Text('Genre (RadioListTitle)',
              textScaleFactor: 2.4,
              textAlign: TextAlign.start,
            ),
            Column(
              children: [
                RadioListTile(
                  title: const Text('Action'),
                  value: 'Action',
                  groupValue: TypeOfMovie,
                  onChanged: (value) {
                    setState(() => TypeOfMovie = value!);
                  },
                ),

                RadioListTile(
                  title: const Text('Comedy'),
                  value: 'Comedy',
                  groupValue: TypeOfMovie,
                  onChanged: (value) {
                    setState(() => TypeOfMovie = value!);
                  },
                ),
              ],
            ),
            Text('Select genre: ${TypeOfMovie.toString()}'),

            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () async {
                final date = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2030),
                  initialDate: DateTime.now(),
                );
                setState(() => selectedDate = date);
              },
              child: const Text('Open Date Picker'),
            ),
            if (selectedDate != null)
              Text('Date: ${selectedDate!.toLocal()}'),
          ],
        ),
      ),
    );
  }
}