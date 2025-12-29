class MyClass {
  final String day;
  final String startTime;
  final String endTime;
  final String courseCode;
  final String courseTitle;
  final String room;
  final String section;
  final String teacher;

  MyClass({
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.courseCode,
    required this.room,
    required this.section,
    required this.teacher,
    required this.courseTitle,
  });

  factory MyClass.fromJson(Map<String, dynamic> json) {
    return MyClass(
      day: json['day'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      courseCode: json['courseCode'],
      room: json['room'],
      section: json['section'],
      teacher: json['teacher'],
      courseTitle: json['courseTitle'],
    );
  }

  Map<String, dynamic> toJson() => {
    'day': day,
    'start_time': startTime,
    'end_time': endTime,
    'courseCode': courseCode,
    'courseTitle': courseTitle,
    'room': room,
    'section': section,
    'teacher': teacher,
  };
}
