// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AnimeModel {
  final String title;
  final String imageURL;
  final String url;

  AnimeModel({required this.title, required this.imageURL, required this.url});

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
      title: json['title']['rendered'] as String,
      imageURL: json['yoast_head_json']['og_image'][0]['url'] as String,
      url: json['link'] as String,
    );
  }
}
