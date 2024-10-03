class TaskModel {
  final int? id;
  final String title;
  final String note;
  final String date;
  final String startTime;
  final String endTime;
  final int isCompleted;

  final int color;

  TaskModel({
    this.id,
    required this.title,
    required this.note,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.isCompleted,
    required this.color,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'], // 'id' can be nullable
      title: json['title'] ?? '', // Provide default values for required fields
      note: json['note'] ?? '',
      date: json['date'] ?? '',
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
      isCompleted: json['isCompleted'] ?? 0, // Ensure this is not null
      color: json['color'] ?? 0, // Ensure this is not null
    );
  }
}
