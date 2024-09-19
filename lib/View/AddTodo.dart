import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => AddTodoState();
}

class AddTodoState extends State<AddTodo> {
  String? title;
  String? descriptions;
  String? date;
  String? time;

  Time? _time; // Changed to nullable
  bool iosStyle = true;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController _date = TextEditingController();

  void onTimeChanged(Time newTime) {
    setState(() {
      _time = newTime; // Update the time
    });
  }

  String formatTime(Time? time) {
    if (time == null)
      return 'Select Time'; // Placeholder when no time is selected
    DateTime dateTime =
        DateTime(2023, 1, 1, time.hour, time.minute); // Arbitrary date
    return DateFormat('hh:mm a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    String displayTime = formatTime(_time);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Notes"),
        backgroundColor: Colors.green,
      ),
      body: Form(
        key: key,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Title",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Enter Task',
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.note_add_outlined),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Full Name';
                  }
                },
              ),
              SizedBox(height: 10),
              Text(
                "Description",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Enter Note',
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.description_outlined),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Correct Email';
                  }
                },
              ),
              SizedBox(height: 10),
              Text(
                "Time",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _date,
                onTap: () {
                  Navigator.of(context).push(
                    showPicker(
                      context: context,
                      value: _time ??
                          Time(hour: 12, minute: 0), // Default to noon if null
                      sunrise: TimeOfDay(hour: 6, minute: 0), // optional
                      sunset: TimeOfDay(hour: 18, minute: 0), // optional
                      onChange: onTimeChanged,
                    ),
                  );
                },
                readOnly: true,
                decoration: InputDecoration(
                  filled: true,
                  hintText: displayTime,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.date_range),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Choose Correct Time';
                  }
                },
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      // Handle submission logic here
                    }
                  },
                  child: Text(
                    "Add Task",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
