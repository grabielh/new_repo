
import 'package:consumo_api/clear_architec/Album/dominio/models/album/albun.dart';

abstract class AlbumGateway {
  Future<Album> getByID(String id);
  Future<List<Album>> getAll();
}
