import 'product_model.dart';

enum CarBrand { BMW, MercedesBenz, Ford, Toyota }

enum CarType { SUV, PickupTruck, MiniVan, Sedan, SportsCar }

class Cars extends ProductModel {
  Cars({
    required super.name,
    required super.color,
    required super.price,
    super.description,
    required this.carBrand,
    required this.carType,
  });
  final CarBrand carBrand;
  final CarType carType;
}
