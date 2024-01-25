import 'package:flutter/material.dart';
import 'package:task_manager/models/task_model.dart';

class HomePageController {
  final TextEditingController taskTitleContoller = TextEditingController();
  final TextEditingController taskDetailsContoller = TextEditingController();

  List<TaskDataModel> taskList = [];

  void taskInfo() {
    taskList.add(TaskDataModel(
        taskName: taskTitleContoller.text,
        taskDetails: taskDetailsContoller.text,
        isComplete: false));
    taskDetailsContoller.clear();
    taskTitleContoller.clear();
  }

  void markCheck(int index) {
    taskList[index].isComplete = !taskList[index].isComplete;
  }
}
