import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:taski/Controller/TaskController.dart';
import 'package:taski/View/AddTodo.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  // List ofNotes = [
  //   {
  //     "title": "First Note",
  //     "desc": "My First Note",
  //     "date": "19-09-2024",
  //     "time": "05:53 PM"
  //   },
  //   {
  //     "title": "MVP Note",
  //     "desc": "This app made with MVP",
  //     "date": "20-10-2025",
  //     "time": "15:50 AM"
  //   },
  //   {
  //     "title": "Provider",
  //     "desc": "Provider use in this app",
  //     "date": "09-12-2030",
  //     "time": "09:40 PM"
  //   },
  //   {
  //     "title": "Animation Lottie",
  //     "desc": "Lottie Files animation are used in this note app",
  //     "date": "32-06-2014",
  //     "time": "02:30 PM"
  //   },
  //   {
  //     "title": "Widget Used in Notes app",
  //     "desc": "All the widgets",
  //     "date": "28-01-2029",
  //     "time": "11:03 AM"
  //   },
  //   {
  //     "title": "First Note",
  //     "desc": "My First Note",
  //     "date": "19-09-2024",
  //     "time": "05:53 PM"
  //   },
  // ];
  @override
  Widget build(BuildContext context) {
    // Access the task controller
    final taskController = Provider.of<Taskcontroller>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTodo()));
        },
        backgroundColor: Colors.green,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        title: Text(
          "Taski",
          style: GoogleFonts.robotoCondensed(
              textStyle: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          child: ListView.builder(
            itemCount: taskController.oftask.length,
            itemBuilder: (context, index) {
              final task = taskController.oftask[index]; // Get task
              return Slidable(
                endActionPane: ActionPane(
                  motion: DrawerMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              TextEditingController titleController =
                                  TextEditingController(text: task.title);
                              TextEditingController descController =
                                  TextEditingController(
                                      text: task.descriptions);
                              return AlertDialog.adaptive(
                                title: Text("Do you want to Update Your Note!"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                        controller: titleController,
                                        decoration: InputDecoration(
                                            labelText: 'Title')),
                                    TextField(
                                        controller: descController,
                                        decoration: InputDecoration(
                                            labelText: 'Description')),
                                  ],
                                ),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        // Update the task using your controller method
                                        taskController.updateTask(
                                            task,
                                            titleController.text,
                                            descController.text);
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Update"))
                                ],
                              );
                            });
                      },
                      backgroundColor: Color(0xFF21B7CA),
                      foregroundColor: Colors.white,
                      icon: Icons.add_box_outlined,
                      label: 'Update',
                    ),
                    SlidableAction(
                      onPressed: (context) {},
                      backgroundColor: Color(0xFF7BC043),
                      foregroundColor: Colors.white,
                      icon: Icons.done_all_outlined,
                      label: 'Done',
                    ),
                  ],
                ),
                startActionPane: ActionPane(motion: DrawerMotion(), children: [
                  SlidableAction(
                    onPressed: (context) {
                      taskController.removeTask(
                          taskController.oftask[index]); // Remove the task
                    },
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ]),
                child: ExpansionTile(
                  title: Text("${task.title ?? ''}",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.description_outlined,
                        color: Colors.green,
                      ),
                      title: Text("Description : ${task.descriptions ?? ''}",
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 21,
                          )),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.date_range_outlined,
                        color: Colors.green,
                      ),
                      title: Text("Date : ${task.date ?? ''}",
                          style: TextStyle(fontSize: 21)),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.access_time_outlined,
                        color: Colors.green,
                      ),
                      title: Text("Time : ${task.time ?? ''}",
                          style: TextStyle(fontSize: 21)),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}
