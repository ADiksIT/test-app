import 'package:flutter/cupertino.dart';

class Photo {
  final String id;
  final String urlRegular;
  final String urlSmall;
  final String description;
  final String authorName;

  Photo(
      {this.id,
      this.urlRegular,
      this.urlSmall,
      this.description,
      this.authorName});

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
      urlRegular: json['urls']['regular'],
      urlSmall: json['urls']['small'],
      id: json['id'],
      description: json['description'] ?? 'This photo has no description',
      authorName: json['user']['name']);
}
