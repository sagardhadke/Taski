import 'package:flutter/material.dart';
import 'package:taski/Models/TaskModels.dart';

class Taskcontroller extends ChangeNotifier {
  
  List<Taskmodels> _oftask = [];

  List<Taskmodels> get oftask => _oftask;

  void addTask(Taskmodels task) {
    _oftask.add(task);
    notifyListeners();
}

void removeTask(Taskmodels task) {
  _oftask.remove(task);
  notifyListeners();
}

void updateTask(Taskmodels oldTask, String newTitle, String newDescription) {
    final index = _oftask.indexOf(oldTask);
    if (index != -1) {
      _oftask[index] = Taskmodels(
        title: newTitle,
        descriptions: newDescription,
        date: oldTask.date, // Keep the old date
        time: oldTask.time, // Keep the old time
      );
      notifyListeners();
    }
  }

}

