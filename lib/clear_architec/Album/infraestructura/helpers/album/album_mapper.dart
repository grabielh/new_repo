
import 'package:consumo_api/clear_architec/Album/dominio/models/album/albun.dart';
import 'package:consumo_api/clear_architec/Album/infraestructura/helpers/common/base_album_mapper.dart';

class  AlbumMapper implements BaseMapper <Album>{
  @override
  fromMap(Map<String, dynamic> json) =>  Album(
    albumId: json['albumId'],
    id: json['id'],
    title: json['title'],
    url: json['url'],
    thumbnailUrl: json['thumbnailUrl']
  );
}