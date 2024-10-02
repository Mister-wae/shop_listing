import 'product_model.dart';

class CustomProduct extends ProductModel {
  CustomProduct({
    required super.name,
    required super.color,
    required super.price,
    super.description,
  });
}
