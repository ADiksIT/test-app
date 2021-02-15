import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_application/constans.dart';
import 'package:test_application/models/photo.dart';

Future<List<Photo>> fetchImages() async {
  const url = '${ENV.API_HOST}/photos?client_id=${ENV.API_KEY}';

  final response = await http.get(url);

  if (response.statusCode != 200) {
    throw Exception(response.body);
  }

  List responseJson = json.decode(response.body);

  return responseJson.map((data) => new Photo.fromJson(data)).toList();
}
