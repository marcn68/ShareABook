enum Condition { Poor, Fine, Good, VeryGood, AsNew }

class Book {
  String isbn;
  String bookTitle;
  List<String> authors;
  String numberOfPages;
  List<String> publishers;
  String publishDate;
  List<String> subjects;
  String cover;
  int price;
  Condition condition;

  Book(this.isbn, this.bookTitle, this.authors, this.numberOfPages,
      this.publishers, this.publishDate, this.subjects, this.cover);

  Book.fromJson(Map<String, dynamic> json) {
    bookTitle = json['title'];
    if (json['authors'] != null) {
      authors = <String>[];
      json['authors'].forEach((v) {
        authors.add(v["name"]);
      });
    }
    if (json['publishers'] != null) {
      publishers = <String>[];
      json['publishers'].forEach((v) {
        publishers.add(v["name"]);
      });
    }
    publishDate = json['publish_date'];
    if (json['subjects'] != null) {
      subjects = <String>[];
      json['subjects'].forEach((v) {
        subjects.add(v["name"]);
      });
    }
    cover = json['cover'] != null ? json['small'] : null;
    price = json['price'];
    condition = json['condition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isbn'] = this.isbn;
    data['title'] = this.bookTitle;
    if (this.authors != null) {
      data['authors'] = this.authors.map((v) => v).toList();
    }
    data['numberOfPages'] = this.numberOfPages;
    if (this.publishers != null) {
      data['publishers'] = this.publishers.map((v) => v).toList();
    }
    data['publish_date'] = this.publishDate;
    if (this.subjects != null) {
      data['subjects'] = this.subjects.map((v) => v).toList();
    }
    if (this.cover != null) {
      data['cover'] = this.cover;
    }
    data['price'] = this.price;
    data['condition'] = this.condition.index;
    return data;
  }
}
