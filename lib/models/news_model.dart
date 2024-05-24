import 'dart:convert';

class News {
  final String title;
  final String description;

  News({required this.title, required this.description});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
    );
  }
}

List<News> newsFromJson(String str) {
  final jsonData = json.decode(str);
  return List<News>.from(jsonData['articles'].map((x) => News.fromJson(x)));
}
