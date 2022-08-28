import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/services/custom_widgets.dart';
import 'package:todo/futures/home/domain/models/task_item_model.dart';
import 'widgets/floating_button.dart';
import 'manager/home_controller.dart';
import 'widgets/body.dart';

class HomeView extends GetWidget<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          "Todos".toUpperCase(),
          color: colorPrimary,
          fontWeight: FontWeight.w900,
        ),
        leading: GestureDetector(
          child: Icon(Icons.delete),
          onTap: () async{
            TaskItemModel().erase();

            controller.loadTasks();
          },
        ),
      ),
      body: const Body(),
      floatingActionButton: const FloatingButton(),
    );
  }
}
