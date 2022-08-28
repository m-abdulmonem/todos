import '/core/services/custom_widgets.dart';

class TaskItemModel extends Model {
  int? id;
  String? name, createdAt;

  TaskItemModel({this.id, this.name, this.createdAt})
      : super('tasks', {
          'id': SqlTypes.integer,
          'name': SqlTypes.text,
          'created_at': SqlTypes.text
        });

  static TaskItemModel fromJson(Map<String, dynamic> json) => TaskItemModel(
      id: json['id'], name: json['name'], createdAt: json['created_at']);

  @override
  Map<String, Object?> toMap() =>
      {'id': id, 'name': name, 'created_at': createdAt};

  @override
  Future<List<TaskItemModel>> all() async {
    var maps = await get();
    return List.generate(maps.length, (i) {
      return TaskItemModel(
        id: maps[i]['id'],
        name: maps[i]['name'],
        createdAt: maps[i]['created_at'],
      );
    });
  }
}
