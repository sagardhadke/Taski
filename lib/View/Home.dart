import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taski/View/AddTodo.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List ofNotes = [
    {
      "title": "First Note",
      "desc": "My First Note",
      "date": "19-09-2024",
      "time": "05:53 PM"
    },
    {
      "title": "MVP Note",
      "desc": "This app made with MVP",
      "date": "20-10-2025",
      "time": "15:50 AM"
    },
    {
      "title": "Provider",
      "desc": "Provider use in this app",
      "date": "09-12-2030",
      "time": "09:40 PM"
    },
    {
      "title": "Animation Lottie",
      "desc": "Lottie Files animation are used in this note app",
      "date": "32-06-2014",
      "time": "02:30 PM"
    },
    {
      "title": "Widget Used in Notes app",
      "desc": "All the widgets",
      "date": "28-01-2029",
      "time": "11:03 AM"
    },
    {
      "title": "First Note",
      "desc": "My First Note",
      "date": "19-09-2024",
      "time": "05:53 PM"
    },
  ];
  @override
  Widget build(BuildContext context) {
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
            itemCount: ofNotes.length,
            itemBuilder: (context, index) {
              return Slidable(
                endActionPane: ActionPane(
                  motion: DrawerMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog.adaptive(
                                title: Text("Do you want to Update Your Note!"),
                                content: Text("Update Your Notes"),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {}, child: Text("Update"))
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
                    onPressed: (context) {},
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ]),
                child: ExpansionTile(
                  title: Text("${ofNotes[index]["title"]}",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.description_outlined,
                        color: Colors.green,
                      ),
                      title: Text("Description : ${ofNotes[index]["desc"]}",
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
                      title: Text("Date : ${ofNotes[index]["date"]}",
                          style: TextStyle(fontSize: 21)),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.access_time_outlined,
                        color: Colors.green,
                      ),
                      title: Text("Time : ${ofNotes[index]["time"]}",
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
