class Medicine {
  final String id;
  final String title;
  final String description;
  final String price;
  final String category;

  Medicine({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
  });

  Medicine copyWith({
    String? id,
    String? title,
    String? description,
    String? price,
    String? category,
  }) {
    return Medicine(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      category: category ?? this.category,
    );
  }

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      id: json['_id'],
      title: json['title'],
      description: json['detail'],
      price: json['price'],
      category: json['category'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Medicine &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.price == price &&
        other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    title.hashCode ^
    description.hashCode ^
    price.hashCode ^
    category.hashCode;
  }
}