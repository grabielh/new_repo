import 'dart:convert';

import 'package:consumo_api/clear_architec/Album/dominio/gateway/album_gateway.dart';
import 'package:consumo_api/clear_architec/Album/dominio/models/album/albun.dart';
import 'package:consumo_api/clear_architec/Album/infraestructura/helpers/album/album_mapper.dart';
import 'package:http/http.dart' as http;
class AlbunApiDelay extends AlbumGateway {
  final AlbumMapper _albumMapper = AlbumMapper();
  @override
  Future<List<Album>> getAll() async {
    await Future.delayed(const Duration(seconds: 2));
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      final List<Album> albums = jsonData
          .map((json) => Album(
                albumId: json['albumId'],
                id: json['id'],
                title: json['title'],
                url: json['url'],
                thumbnailUrl: json['thumbnailUrl'],
              ))
          .toList();
      return albums;
    }

    throw Exception('Error al obtener la lista de álbumes');
  }

  @override
  Future<Album> getByID(String id) async {
    await Future.delayed(const Duration(seconds: 2));
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/photos/$id');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return _albumMapper.fromMap(jsonDecode(response.body));
    }
    throw UnimplementedError('Error 404');
  }
}
