import 'package:consumo_api/clear_architec/dominio/models/album/albun.dart';
import 'package:consumo_api/clear_architec/infraestructura/helpers/common/base_album_mapper.dart';

class  AlbumMapper implements BaseMapper <Album>{
  @override
  fromMap(Map<String, dynamic> json) =>  Album(
    albumId: json['userId'],
    id: json['id'],
    title: json['title'],
    url: json['url'],
    thumbnailUrl: json['thumbnailUrl']
  );
}