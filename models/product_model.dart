// create product

class ProductModel {
  String name;
  String color;
  String price;
  String? description;

  ProductModel({
    required this.name,
    required this.color,
    required this.price,
    this.description,
  });
}
