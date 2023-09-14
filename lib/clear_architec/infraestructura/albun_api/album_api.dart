import 'dart:convert';

import 'package:consumo_api/clear_architec/dominio/gateway/album_gateway.dart';
import 'package:consumo_api/clear_architec/dominio/models/album/albun.dart';
import 'package:consumo_api/clear_architec/infraestructura/helpers/album/album_mapper.dart';
import 'package:http/http.dart' as http;

class AlbunApiDelay extends AlbumGateway {
  final AlbumMapper _albumMapper = AlbumMapper();
  @override
  Future<Album> getAll() async {
    throw UnimplementedError('No se a implementado este Metodo !!');
  }

  @override
  Future<Album> getByID(String id) async {
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/photos/$id');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return _albumMapper.fromMap(jsonDecode(response.body));
    }
    throw UnimplementedError();
  }
}