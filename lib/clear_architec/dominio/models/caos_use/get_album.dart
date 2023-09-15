import 'package:consumo_api/clear_architec/dominio/gateway/album_gateway.dart';
import 'package:consumo_api/clear_architec/dominio/models/album/albun.dart';

class GetAlbumuseCase {
  final AlbumGateway _albumGateway;
  GetAlbumuseCase(this._albumGateway);
  Future<Album> getAlbumID(String id) async {
    return _albumGateway.getByID(id);
  }

  Future<List<Album>> getAll() async {
    return _albumGateway.getAll();
  }
}
