// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RepositoryModel {
  final String name;
  final String? description;
  final String url;

  RepositoryModel({
    required this.name,
    this.description,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'html_url': url,
    };
  }

  factory RepositoryModel.fromMap(Map<String, dynamic> map) {
    return RepositoryModel(
      name: map['name'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      url: map['html_url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RepositoryModel.fromJson(String source) =>
      RepositoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'RepositoryModel(name: $name, description: $description, html_url: $url)';
}
