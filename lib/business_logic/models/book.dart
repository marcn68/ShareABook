enum Condition { Poor, Fine, Good, VeryGood, AsNew }

class Book {
  String isbn;
  String title;
  List<String> authors;
  String numberOfPages;
  List<String> publishers;
  String publishDate;
  List<String> subjects;
  String cover;
  int price;
  Condition condition;
  int popularity;

  Book(
      {this.isbn,
      this.title,
      this.authors,
      this.numberOfPages,
      this.publishers,
      this.publishDate,
      this.subjects,
      this.cover});

  Book.fromJson(Map<String, dynamic> json) {
    isbn = json['isbn'];
    title = json['title'];
    authors = json['authors'].cast<String>();
    numberOfPages = json['numberOfPages'].toString();
    publishers = json['publishers'].cast<String>();
    publishDate = json['publishDate'];
    subjects = json['subjects'].cast<String>();
    cover = json['cover'];
    price = json['price'];
    condition = Condition.values[json['condition']];
    popularity = json['popularity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isbn'] = this.isbn;
    data['title'] = this.title;
    data['authors'] = this.authors;
    data['numberOfPages'] = this.numberOfPages;
    data['publishers'] = this.publishers;
    data['publishDate'] = this.publishDate;
    data['subjects'] = this.subjects;
    data['cover'] = this.cover;
    data['price'] = this.price;
    data['condition'] = this.condition.index;
    data['popularity'] = this.popularity;
    return data;
  }
}