import 'package:flutter/material.dart';
import 'package:taski/Models/TaskModels.dart';

class Taskcontroller extends ChangeNotifier {

  List <Taskmodels> _oftask = [
    Taskmodels(
      title: "this is 1st",
      descriptions: "this is description",
      date: "5/09/2024",
      time: "9:30 pm"
    )
  ];

}