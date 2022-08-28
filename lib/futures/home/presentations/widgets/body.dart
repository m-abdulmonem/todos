import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/futures/home/presentations/widgets/task_item.dart';
import '../../domain/models/task_item_model.dart';
import '../manager/home_controller.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List tasks = [];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => RefreshIndicator(
              onRefresh: () => _onRefresh(controller),
              child: _lisView(controller),
            ));
  }

  Widget _lisView(controller) => ListView.builder(
        // reverse: true,
        itemBuilder: (_, index) {
          TaskItemModel task = controller.tasks[index];

          return TaskItem(
            id: task.id,
            name: task.name,
            createdAt: task.createdAt,
          );
        },
        itemCount: controller.tasks.length,
      );

  Future<void> _onRefresh(controller) =>
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          controller.loadTasks();
        });
      });
}
