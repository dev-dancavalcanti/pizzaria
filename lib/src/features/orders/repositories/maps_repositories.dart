import 'package:pizzaria/env.dart';
import 'package:pizzaria/src/features/orders/model/map_model.dart';
import 'package:pizzaria/src/features/orders/services/http/http_service.dart';

class MapsRepositories {
  final HttpService _httpClient;
  MapsRepositories(this._httpClient);

  Future<MapDistanceDurationModel> get(String path) async {
    var response = await _httpClient.get(
        "json?origins=-15.5472162%2C-47.344899&key=$GOOGLE_MAPS_API_KEY&destinations=$path");
    var data = MapDistanceDurationModel.fromJson(response.data);
    return data;
  }
}
