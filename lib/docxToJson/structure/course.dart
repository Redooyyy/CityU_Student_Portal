class Course {
  final String code;
  final String title;
  final double credit;

  Course({required this.code, required this.title, required this.credit});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      code: json['code'],
      title: json['title'],
      credit: (json['credit'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'code': code,
    'title': title,
    'credit': credit,
  };
}
