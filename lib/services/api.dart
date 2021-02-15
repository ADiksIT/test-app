import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/photo.dart';

Future<List<Photo>> fetchImages() async {
  const url =
      'https://api.unsplash.com/photos?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0';

  final response = await http.get(url);

  if (response.statusCode != 200) {
    throw Exception(response.body);
  }

  List responseJson = json.decode(response.body);

  return responseJson.map((data) => new Photo.fromJson(data)).toList();
}
