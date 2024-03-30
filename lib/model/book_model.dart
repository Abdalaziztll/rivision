// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BookModel {
  num id;
  String title;
  String author;
  String cover_image;
  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.cover_image,
  });

  BookModel copyWith({
    num? id,
    String? title,
    String? author,
    String? cover_image,
  }) {
    return BookModel(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      cover_image: cover_image ?? this.cover_image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'author': author,
      'cover_image': cover_image,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      id: map['id'] as num,
      title: map['title'] as String,
      author: map['author'] as String,
      cover_image: map['cover_image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) => BookModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BookModel(id: $id, title: $title, author: $author, cover_image: $cover_image)';
  }

  @override
  bool operator ==(covariant BookModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.author == author &&
      other.cover_image == cover_image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      author.hashCode ^
      cover_image.hashCode;
  }
}
