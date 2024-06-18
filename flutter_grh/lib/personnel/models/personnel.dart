class Personnel {
  final int? id;
  final String name;
  final String position;

  Personnel({this.id, required this.name, required this.position});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'position': position,
    };
  }

  factory Personnel.fromMap(Map<String, dynamic> map) {
    return Personnel(
      id: map['id'],
      name: map['name'],
      position: map['position'],
    );
  }
}
