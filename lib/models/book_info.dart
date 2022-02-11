class BookInfo {
  String? id;
  String? name;
  String? cover;
  String? author;
  String? press;
  String? producer;
  double? price;
  int? pagesNumber;
  String? isbn;
  double? score;

  BookInfo(
      {this.id,
      this.name,
      this.cover,
      this.author,
      this.press,
      this.producer,
      this.price,
      this.pagesNumber,
      this.isbn,
      this.score});

  BookInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cover = json['cover'];
    author = json['author'];
    press = json['press'];
    producer = json['producer'];
    price = json['price'];
    pagesNumber = json['pagesNumber'];
    isbn = json['isbn'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['cover'] = cover;
    data['author'] = author;
    data['press'] = press;
    data['producer'] = producer;
    data['price'] = price;
    data['pagesNumber'] = pagesNumber;
    data['isbn'] = isbn;
    data['score'] = score;
    return data;
  }
}
