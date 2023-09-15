import 'package:consumo_api/clear_architec/dominio/models/caos_use/get_album.dart';
import 'package:consumo_api/clear_architec/infraestructura/driven_adapter/albun_api_adapter.dart';

class UsecaseConfig {
  late GetAlbumuseCase getAlbunCasouse;
  late AlbunApiDelay _albunApiDelay;
  UsecaseConfig() {
    _albunApiDelay = AlbunApiDelay();
    getAlbunCasouse = GetAlbumuseCase(_albunApiDelay);
  }
}
