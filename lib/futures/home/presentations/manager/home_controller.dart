import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '/core/services/custom_widgets.dart';
import '../widgets/task_dialog.dart';
import '../../domain/models/task_item_model.dart';

class HomeController extends GetxController {
  TextEditingController taskInput = TextEditingController();

  List<TaskItemModel> tasks = [];

  HomeController() {
    loadTasks();
  }

  /// load All tasks from database
  /// set loaded tasks to [tasks List]
  void loadTasks() async {
    ///empty tasks list
    tasks.clear();

    /// load and add tasks to [tasks list]
    TaskItemModel().all().then((value) => tasks = value);

    ///update state
    update();
  }

  void edit(int id, String? name) async {
    TaskDialog(name: name!, id: id).show();
  }

  void createTask() async {
    TaskItemModel taskItemModel = TaskItemModel(
        name: taskInput.text, createdAt: DateTime.now().toString());

    taskItemModel.insert().then((val) {
      _afterTaskAction("Task was Created Successfully");
    });
  }

  void deleteTask(int id, String? name) async {
    int result = await TaskItemModel().delete(id);

    if (result == 1) {
      CustomWidgets.snackBar(CustomText("Task $name was deleted"));
    } else {
      CustomWidgets.snackBar(CustomText("Cannot delete $name"));
    }

    loadTasks();
  }

  void updateTask(int id, String name) async {
    TaskItemModel? task = await TaskItemModel().getItem(id);

    var result =
        await TaskItemModel(id: id, name: name, createdAt: task?.createdAt)
            .update(id);

    if (result == 1) {
      _afterTaskAction("Task $name was updated");
    } else {
      CustomWidgets.snackBar("Cannot update $name");
    }
  }

  void _afterTaskAction(String msg) {
    CustomWidgets.snackBar(CustomText(msg));

    taskInput.clear();

    loadTasks();

    Get.back();
  }
}
