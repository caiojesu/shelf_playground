class NewsModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final DateTime publishDate;
  final DateTime updateDate;

  NewsModel(
    this.id,
    this.title,
    this.description,
    this.image,
    this.publishDate,
    this.updateDate,
  );

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      json['id'] as int,
      json['title'] as String,
      json['description'] as String,
      json['image'] as String,
      DateTime.parse(json['publishDate'] as String),
      DateTime.parse(json['updateDate'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'publishDate': publishDate.toIso8601String(),
      'updateDate': updateDate.toIso8601String(),
    };
  }
}
