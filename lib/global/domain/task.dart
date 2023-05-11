///entidade da tarefa
class TaskModel {
  TaskModel({
    required this.description,
    required this.title,
    required this.isChecked,
    required this.id,
  });

  // Método fromJson para desserialização de JSON provido pelo banco de dados.
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      title: json['title'],
      description: json['description'],
      isChecked: json['isChecked'],
      id: json['id'],
    );
  }

  final String title;
  final String description;
  final String id;
  bool isChecked = false;
}
