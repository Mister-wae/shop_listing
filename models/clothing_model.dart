import 'product_model.dart';

enum Sizes { S, M, L, XL }

enum Brand { Versace, Gucci, LouisVutton, Fendi }

class Clothing extends ProductModel {
  Clothing({
    required this.size,
    required super.name,
    required super.color,
    super.description,
    required super.price,
    required this.brand,
  });
  Sizes size;
  Brand brand;
}
