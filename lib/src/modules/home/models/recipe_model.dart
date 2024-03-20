// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RecipeModel {
  final int id;
  final String name;
  final String type;
  final String description;
  final String ingredients;
  final String level;
  final String linkImage;

  RecipeModel({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.ingredients,
    required this.level,
    required this.linkImage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'description': description,
      'ingredients': ingredients,
      'level': level,
      'linkImage': linkImage,
    };
  }

  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(
      id: map['id'],
      name: map['name'],
      type: map['type'],
      description: map['description'],
      ingredients: map['ingredients'],
      level: map['level'],
      linkImage: map['link_image'] ,
    );
  }

  factory RecipeModel.fromJson(String str) =>
      RecipeModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
}
