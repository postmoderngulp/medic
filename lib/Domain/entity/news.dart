class news {
  String id;
  String title;
  String description;
  int price;
  String image;

  news(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.image});

  factory news.fromJson(Map<String, dynamic> json) {
    return news(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        image: json['image']);
  }
}
