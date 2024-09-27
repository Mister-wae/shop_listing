import 'functions/product_functions.dart';
import 'functions/shop_functions.dart';
import 'models/shop_model.dart';

void main(List<String> args) {
  Shop? userShop = createShop();
  if (userShop != null) {
    print("Welcome to Dart Shopping Experience, ${userShop.name}");
    createProduct();
  }
}
