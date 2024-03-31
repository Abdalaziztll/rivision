
import 'dart:convert';

class Cat {
  num id;
  String name;
  String origin;
  String image;
  Cat({
    required this.id,
    required this.name,
    required this.origin,
    required this.image,
  });


  Cat copyWith({
    num? id,
    String? name,
    String? origin,
    String? image,
  }) {
    return Cat(
      id: id ?? this.id,
      name: name ?? this.name,
      origin: origin ?? this.origin,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'origin': origin,
      'image': image,
    };
  }

  factory Cat.fromMap(Map<String, dynamic> map) {
    return Cat(
      id: map['id'] as num,
      name: map['name'] as String,
      origin: map['origin'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cat.fromJson(String source) => Cat.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cat(id: $id, name: $name, origin: $origin, image: $image)';
  }

  @override
  bool operator ==(covariant Cat other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.origin == origin &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      origin.hashCode ^
      image.hashCode;
  }
}
