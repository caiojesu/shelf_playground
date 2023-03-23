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
}
