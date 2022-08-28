import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/services/custom_widgets.dart';
import '../manager/home_controller.dart';

class TaskDialog {
  final HomeController _controller = Get.put(HomeController());

  int? id;
  String name;

  TaskDialog({this.name = "", this.id}) {
    if (name.isNotEmpty) {
      _controller.taskInput.text = name;
    }
  }

  void show() {
    Get.defaultDialog(
      title: "${name.isNotEmpty ? "Update" : "Create"} Task",
      content: _buildContent(),
      confirm: _buildConfirm(),
      cancel: _buildCancel(),
    );
  }

  Widget _buildContent() => Column(
        children: [
          CustomInput(
            controller: _controller.taskInput,
            hint: "ex: create blog",
            label: "Task name",
          )
        ],
      );

  Widget _buildConfirm() => CustomText(
        "Save",
        onTap: _onConfirm,
        color: colorPrimary,
        fontWeight: FontWeight.w900,
        fontSize: 19,
      );

  void _onConfirm() {
    if (name.isNotEmpty) {
      _controller.updateTask(id!, _controller.taskInput.text);
    } else {
      _controller.createTask();
    }
  }

  Widget _buildCancel() => CustomText(
        "Cancel",
        onTap: () => Get.back(),
      );
}
