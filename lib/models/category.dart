class Category {
  final String? id;
  final String? name;
  final String? type;
  final String? icon;
  final bool? is_system;
  final String? createdAt;
  final String? updatedAt;

  Category({
    this.id,
    this.name,
    this.type,
    this.icon,
    this.is_system,
    this.createdAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      icon: json['icon'],
      is_system: json['is_system'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
