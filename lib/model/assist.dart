import 'dart:convert';

class Assist {
  int id;
  String title;
  String description;

//<editor-fold desc="Data Methods">
  Assist({
    required this.id,
    required this.title,
    required this.description,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Assist &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description);

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ description.hashCode;

  String toJson() => json.encode(toMap());
  factory Assist.fromJson(String source) => Assist.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Assist{' +
        ' id: $id,' +
        ' title: $title,' +
        ' description: $description,' +
        '}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'description': this.description,
    };
  }

  factory Assist.fromMap(Map<String, dynamic> map) {
    return Assist(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }

//</editor-fold>
}
