import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/task_dialog.dart';
import '../manager/home_controller.dart';

class FloatingButton extends GetWidget<HomeController> {
  const FloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () =>  TaskDialog().show(),
    );
  }
}
