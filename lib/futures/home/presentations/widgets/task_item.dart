import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '/core/services/custom_widgets.dart';
import 'package:intl/intl.dart';
import '../manager/home_controller.dart';

class TaskItem extends GetWidget<HomeController> {
  final int? id;
  final String? name, createdAt;

  const TaskItem({this.id, this.name, this.createdAt, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        child: _buildSwipe(),
      ),
    );
  }

  Widget _buildSwipe() => Slidable(
        key: ValueKey(id),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (buildContext) => controller.edit(id!, name),
              backgroundColor: const Color(0xFF0392CF),
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (buildContext) => controller.deleteTask(id!, name),
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: _buildListTile(),
      );

  Widget _buildListTile() => ListTile(
        title: Row(
          children: [
            CustomText(
              name?.toCapitalize ?? "",
              fontSize: 18,
            ),
            CustomText(
              "${_dateFormat()}  - ",
              fontSize: 12,
            )
          ],
        ),
      );

  String _dateFormat() => DateFormat('jm').format(DateTime.parse(createdAt!));
}
