import 'package:flutter/material.dart';
import 'package:taski/Models/TaskModels.dart';

class Taskcontroller extends ChangeNotifier {

  List <Taskmodels> _oftask = [
    Taskmodels(
      title: "this is 1st",
      descriptions: "this is description",
      startTime: "5:30pm",
      endTime: "9:30 pm"
    )
  ];

}