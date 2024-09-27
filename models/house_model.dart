import 'product_model.dart';

enum HouseType {
  Villa,
  MonoPlex,
  Duplex,
  Bungalow,
  StoreyBuilding,
  DetatchedBuilding
}

class Houses extends ProductModel {
  Houses({
    required super.name,
    required super.color,
    required super.price,
    super.description,
    required this.houseType,
  });
  final HouseType houseType;
}
