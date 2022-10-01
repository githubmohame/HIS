
import 'dart:convert';

class SpecialistModel {
  String imageUrl;
  String title;
  SpecialistModel({
    required this.imageUrl,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'imageUrl': imageUrl});
    result.addAll({'title': title});
  
    return result;
  }

  factory SpecialistModel.fromMap(Map<String, dynamic> map) {
    return SpecialistModel(
      imageUrl: map['imageUrl'] ?? '',
      title: map['title'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SpecialistModel.fromJson(String source) => SpecialistModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SpecialistModel &&
      other.imageUrl == imageUrl &&
      other.title == title;
  }

  @override
  int get hashCode => imageUrl.hashCode ^ title.hashCode;

  SpecialistModel copyWith({
    String? imageUrl,
    String? title,
  }) {
    return SpecialistModel(
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
    );
  }

  @override
  String toString() => 'SpecialistModel(imageUrl: $imageUrl, title: $title)';
}