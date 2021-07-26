class Enterprise {
  Enterprise(
    this.id,
    this.name,
    this.logoUrl,
    this.photoUrl,
    this.description,
    this.type,
  );

  final int id;
  String name;
  final String logoUrl;
  final String photoUrl;
  final String description;
  final String type;

  static Enterprise get empty => Enterprise(0, '', '', '', '', '');
  bool get isEmpty =>
      id == 0 &&
      name.isEmpty &&
      photoUrl.isEmpty &&
      description.isEmpty &&
      type.isEmpty;

  factory Enterprise.fromJson(Map<String, dynamic> json) => Enterprise(
        json['id'],
        json['enterprise_name'],
        '', // json['logo'],
        json['photo'],
        json['description'],
        json['enterprise_type']['enterprise_type_name'],
      );
}
