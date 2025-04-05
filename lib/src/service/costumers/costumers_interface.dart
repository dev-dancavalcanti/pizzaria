import 'package:pizzaria/src/domain/entities/costumers_entity.dart';

abstract class ICostumersInterface {
  Future initialize() async {}

  Future<void> updateData(CostumersModel costumerList) async {}

  Future<void> firstInit() async {}
}
