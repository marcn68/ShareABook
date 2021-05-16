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

// class Book {
//   String isbn;
//   String title;
//   List<String> authors;
//   String numberOfPages;
//   List<String> publishers;
//   String publishDate;
//   List<String> subjects;
//   String cover;
//   int price;
//   Condition condition;
//   int popularity;

//   Book(this.isbn, this.title, this.authors, this.numberOfPages, this.publishers,
//       this.publishDate, this.subjects, this.cover);

//   Book.fromJson(Map<String, dynamic> json) {
//     isbn = json['isbn'];
//     title = json['title'];
//     if (json['authors'] != null) {
//       authors = <String>[];
//       json['authors'].forEach((v) {
//         authors.add(v["name"]);
//       });
//     }
//     numberOfPages = json['numberOfPages'];
//     if (json['publishers'] != null) {
//       publishers = <String>[];
//       json['publishers'].forEach((v) {
//         publishers.add(v["name"]);
//       });
//     }
//     publishDate = json['publishDate'];
//     if (json['subjects'] != null) {
//       subjects = <String>[];
//       json['subjects'].forEach((v) {
//         subjects.add(v["name"]);
//       });
//     }
//     cover = json['cover'] != null ? json['medium'] : null;
//     price = json['price'];
//     condition = json['condition'];
//     popularity = json['popularity'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['isbn'] = this.isbn;
//     data['title'] = this.title;
//     if (this.authors != null) {
//       data['authors'] = this.authors.map((v) => v).toList();
//     }
//     data['numberOfPages'] = this.numberOfPages;
//     if (this.publishers != null) {
//       data['publishers'] = this.publishers.map((v) => v).toList();
//     }
//     data['publishDate'] = this.publishDate;
//     if (this.subjects != null) {
//       data['subjects'] = this.subjects.map((v) => v).toList();
//     }
//     if (this.cover != null) {
//       data['cover'] = this.cover;
//     }
//     data['price'] = this.price;
//     data['condition'] = this.condition.index;
//     data['popularity'] = this.popularity;
//     return data;
//   }
//}
