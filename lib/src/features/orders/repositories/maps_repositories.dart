import 'package:pizzaria/src/features/orders/model/map_model.dart';
import 'package:pizzaria/src/features/orders/services/http/http_service.dart';
import 'package:pizzaria/src/features/orders/services/http/http_service_imp.dart';

class MapsRepositories implements HttpService {
  final HttpServiceDio _httpClient;
  MapsRepositories(this._httpClient);

  @override
  Future<MapDistanceDurationModel> get(String path) async {
    var response = await _httpClient.get("path");
    return MapDistanceDurationModel.fromJson(response.data);
  }
}
