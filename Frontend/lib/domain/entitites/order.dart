class Order {
  final String id;
  final String medicineTitle;
  final String date;
  final String userId;
  final String medId;
  final String quantity;

  Order({
    required this.id,
    required this.medicineTitle,
    required this.date,
    required this.userId,
    required this.medId,
    required this.quantity,
  });

  Order copyWith({
    String? id,
    String? medicineTitle,
    String? date,
    String? userId,
    String? medId,
    String? quantity,
  }) {
    return Order(
      id: id ?? this.id,
      medicineTitle: medicineTitle ?? this.medicineTitle,
      date: date ?? this.date,
      userId: userId ?? this.userId,
      medId: medId ?? this.medId,
      quantity: quantity ?? this.quantity,
    );
  }

  factory Order.fromJson(Map<String, dynamic> json, String medicineTitle) {
    return Order(
      id: json['_id'],
      medicineTitle: medicineTitle,
      date: json['date'],
      userId: json['userId'],
      medId: json['medicineId'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'medicineId': medId,
    'date': date,
    'quantity': quantity,
  };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Order &&
        other.id == id &&
        other.medicineTitle == medicineTitle &&
        other.date == date &&
        other.userId == userId &&
        other.medId == medId &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    medicineTitle.hashCode ^
    date.hashCode ^
    userId.hashCode ^
    medId.hashCode ^
    quantity.hashCode;
  }
}