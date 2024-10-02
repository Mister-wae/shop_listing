import 'dart:io';

import '../models/cars_model.dart';
import '../models/clothing_model.dart';
import '../models/house_model.dart';
import '../models/customProduuct_model.dart';
import 'shop_functions.dart';

var currentProduct;
int? selectedIndex;

List products = [];

List<String> productsType = ["Cars", "Clothing", "House", "Custom Product"];

// remember to return a boolean value
void createProduct() {
  selectProductType();
  switch (selectedIndex) {
    case 0:
      createCarProduct();
    case 1:
      createClothingProduct();
    case 2:
      createHouseProduct();
    case 3:
      createCustomProduct();
      break;
    default:
      0;
  }
  products.add(currentProduct);
  print("Do you wish to create another product?[yes/no]");
  String? response = stdin.readLineSync();
  if (response != null && response.toLowerCase() != "no") {
    response = response.toLowerCase();
    createProduct();
  } else if (response != null && response.toLowerCase() == "no") {
    print("Do you wish to view your shop?[yes/no]");
    String? viewResponse = stdin.readLineSync();
    if (viewResponse != null && viewResponse.toLowerCase() != "no") {
      displayProducts();
    }
  }
}

selectProductType() {
  RegExp regExp = RegExp(r'^\d+$');
  bool selectedIndexHasError = false;
  do {
    int i = 0;
    print(selectedIndexHasError ? "Invalid Input" : "Creating product....");
    print("Select your product type");
    for (var type in productsType) {
      i++;
      print("$i: $type");
    }
    String? selectedNumber = stdin.readLineSync();
    if (selectedNumber != null) {
      if (!regExp.hasMatch(selectedNumber)) {
        selectedIndexHasError = true;
      } else {
        selectedIndex = int.parse(selectedNumber) - 1;
        if (selectedIndex! > 3 || selectedIndex! < 0) {
          selectedIndexHasError = true;
        } else {
          selectedIndexHasError = false;
        }
      }
    } else {
      selectedIndexHasError = true;
    }
  } while (selectedIndexHasError);
}

createCarProduct() {
  // get properties of the car
  // car name
  String? carName;
  bool carNameHasError = false;
  do {
    print(carNameHasError
        ? "Invalid Input! Re-enter car name"
        : "Enter car name");
    carName = stdin.readLineSync();
    if (carName == null) {
      carNameHasError = true;
    } else if (carName.isEmpty) {
      carNameHasError = true;
    } else {
      carNameHasError = false;
    }
  } while (carNameHasError);

  // car color
  String? carColor;
  bool carColorHasError = false;
  do {
    print(carColorHasError
        ? "Invalid Input! Re-enter car color"
        : "Enter car color");
    carColor = stdin.readLineSync();
    if (carColor == null) {
      carColorHasError = true;
    } else if (carColor.isEmpty) {
      carColorHasError = true;
    } else {
      carColorHasError = false;
    }
  } while (carColorHasError);

  // car description
  String? carDescription;
  bool carDescriptionHasError = false;
  do {
    print(carDescriptionHasError
        ? "Invalid Input! Re-enter car description"
        : "Enter car description");
    carDescription = stdin.readLineSync();
    if (carDescription == null) {
      carDescriptionHasError = true;
    } else if (carDescription.isEmpty) {
      carDescriptionHasError = true;
    } else {
      carDescriptionHasError = false;
    }
  } while (carDescriptionHasError);

  // car price
  String? carPrice;
  RegExp regExp = RegExp(r'^\d+$');
  bool carPriceHasError = false;
  do {
    print(carDescriptionHasError
        ? "Invalid Input! Re-enter car price"
        : "Enter car price");
    carPrice = stdin.readLineSync();
    if (carPrice == null) {
      carPriceHasError = true;
    } else if (carPrice.isEmpty) {
      carPriceHasError = true;
    } else if (!regExp.hasMatch(carPrice)) {
      carPriceHasError = true;
    } else {
      carPriceHasError = false;
    }
  } while (carPriceHasError);

  // car brand
  List<String> carBrands = CarBrand.values.map((_) {
    return _.toString();
  }).toList();
  int? carBrandIndex;
  bool carBrandIndexHasError = false;

  do {
    int i = 0;
    print(carBrandIndexHasError ? "Invalid Input. Select one:" : "Select one:");
    for (var brand in carBrands) {
      i++;
      print("$i: ${brand.replaceRange(0, 9, '')}");
    }
    String? carBrandIndexString = stdin.readLineSync();
    if (carBrandIndexString != null) {
      if (!regExp.hasMatch(carBrandIndexString)) {
        carBrandIndexHasError = true;
      } else {
        carBrandIndex = int.parse(carBrandIndexString) - 1;
        if (selectedIndex! > 3 || selectedIndex! < 0) {
          carBrandIndexHasError = true;
        } else {
          carBrandIndexHasError = false;
        }
      }
    } else {
      carBrandIndexHasError = true;
    }
  } while (carBrandIndexHasError);

  // car Type

  List<String> carTypes = CarType.values.map((_) {
    return _.toString();
  }).toList();
  int? carTypeIndex;
  bool carTypeIndexHasError = false;

  do {
    int i = 0;
    print(carTypeIndexHasError ? "Invalid Input. Select one:" : "Select one:");
    for (var type in carTypes) {
      i++;
      print("$i: ${type.replaceRange(0, 8, '')}");
    }
    String? carTypeIndexString = stdin.readLineSync();
    if (carTypeIndexString != null) {
      if (!regExp.hasMatch(carTypeIndexString)) {
        carTypeIndexHasError = true;
      } else {
        carTypeIndex = int.parse(carTypeIndexString) - 1;
        if (selectedIndex! > 4 || selectedIndex! < 0) {
          carTypeIndexHasError = true;
        } else {
          carTypeIndexHasError = false;
        }
      }
    } else {
      carTypeIndexHasError = true;
    }
  } while (carTypeIndexHasError);

  currentProduct = Cars(
    name: carName!,
    color: carColor!,
    price: carPrice!,
    description: carDescription!,
    carBrand: CarBrand.values[carBrandIndex!],
    carType: CarType.values[carTypeIndex!],
  );

  print(
      "Car Created SuccessFully!\nSpecifications:\nCar name: ${currentProduct.name}\nCar color: ${currentProduct.color}\nCar price: ₦${currentProduct.price}\n${currentProduct.description}.\n '${currentProduct.carBrand.toString().replaceRange(0, 9, '')}'••••••'${currentProduct.carType.toString().replaceRange(0, 8, '')}'.");
  // create the car product.
}

createClothingProduct() {
  // get properties of the cloth
  // cloth name
  String? clothName;
  bool clothNameHasError = false;
  do {
    print(clothNameHasError
        ? "Invalid Input! Re-enter cloth name"
        : "Enter cloth name");
    clothName = stdin.readLineSync();
    if (clothName == null) {
      clothNameHasError = true;
    } else if (clothName.isEmpty) {
      clothNameHasError = true;
    } else {
      clothNameHasError = false;
    }
  } while (clothNameHasError);

  // cloth color
  String? clothColor;
  bool clothColorHasError = false;
  do {
    print(clothColorHasError
        ? "Invalid Input! Re-enter cloth color"
        : "Enter cloth color");
    clothColor = stdin.readLineSync();
    if (clothColor == null) {
      clothColorHasError = true;
    } else if (clothColor.isEmpty) {
      clothColorHasError = true;
    } else {
      clothColorHasError = false;
    }
  } while (clothColorHasError);

  // cloth description
  String? clothDescription;
  bool clothDescriptionHasError = false;
  do {
    print(clothDescriptionHasError
        ? "Invalid Input! Re-enter cloth description"
        : "Enter cloth description");
    clothDescription = stdin.readLineSync();
    if (clothDescription == null) {
      clothDescriptionHasError = true;
    } else if (clothDescription.isEmpty) {
      clothDescriptionHasError = true;
    } else {
      clothDescriptionHasError = false;
    }
  } while (clothDescriptionHasError);

  // cloth price
  String? clothPrice;
  RegExp regExp = RegExp(r'^\d+$');
  bool clothPriceHasError = false;
  do {
    print(clothDescriptionHasError
        ? "Invalid Input! Re-enter cloth price"
        : "Enter cloth price");
    clothPrice = stdin.readLineSync();
    if (clothPrice == null) {
      clothPriceHasError = true;
    } else if (clothPrice.isEmpty) {
      clothPriceHasError = true;
    } else if (!regExp.hasMatch(clothPrice)) {
      clothPriceHasError = true;
    } else {
      clothPriceHasError = false;
    }
  } while (clothPriceHasError);

  // cloth brand
  List<String> clothBrands = Brand.values.map((_) {
    return _.toString();
  }).toList();
  int? clothBrandIndex;
  bool clothBrandIndexHasError = false;

  do {
    int i = 0;
    print(
        clothBrandIndexHasError ? "Invalid Input. Select one:" : "Select one:");
    for (var brand in clothBrands) {
      i++;
      print("$i: ${brand.replaceRange(0, 6, '')}");
    }
    String? clothBrandIndexString = stdin.readLineSync();
    if (clothBrandIndexString != null) {
      if (!regExp.hasMatch(clothBrandIndexString)) {
        clothBrandIndexHasError = true;
      } else {
        clothBrandIndex = int.parse(clothBrandIndexString) - 1;
        if (selectedIndex! > 3 || selectedIndex! < 0) {
          clothBrandIndexHasError = true;
        } else {
          clothBrandIndexHasError = false;
        }
      }
    } else {
      clothBrandIndexHasError = true;
    }
  } while (clothBrandIndexHasError);

  // cloth sizes

  List<String> clothSizes = Sizes.values.map((_) {
    return _.toString();
  }).toList();
  int? clothSizesIndex;
  bool clothSizesHasError = false;

  do {
    int i = 0;
    print(clothSizesHasError ? "Invalid Input. Select one:" : "Select one:");
    for (var type in clothSizes) {
      i++;
      print("$i: ${type.replaceRange(0, 6, '')}");
    }
    String? clothSizesIndexString = stdin.readLineSync();
    if (clothSizesIndexString != null) {
      if (!regExp.hasMatch(clothSizesIndexString)) {
        clothSizesHasError = true;
      } else {
        clothSizesIndex = int.parse(clothSizesIndexString) - 1;
        if (clothSizesIndex >= clothSizes.length || clothSizesIndex < 0) {
          clothSizesHasError = true;
        } else {
          clothSizesHasError = false;
        }
      }
    } else {
      clothSizesHasError = true;
    }
  } while (clothSizesHasError);

  currentProduct = Clothing(
    name: clothName!,
    color: clothColor!,
    price: clothPrice!,
    description: clothDescription!,
    brand: Brand.values[clothBrandIndex!],
    size: Sizes.values[clothSizesIndex!],
  );

  print("Clothing Created SuccessFully!\n"
      "Specifications:\n"
      "Clothing name: ${currentProduct.name}\n"
      "Clothing color: ${currentProduct.color}\n"
      "Clothing price: ₦${currentProduct.price}\n"
      "${currentProduct.description}.\n'${currentProduct.brand.toString().replaceRange(0, 6, '')}'********'${currentProduct.size.toString().replaceRange(0, 6, '')}'.");
  // create the cloth product.
}

createHouseProduct() {
  String? houseName;
  bool houseNameHasError = false;
  do {
    print(houseNameHasError
        ? "Invalid Input! Re-enter house name"
        : "Enter house name");
    houseName = stdin.readLineSync();
    if (houseName == null) {
      houseNameHasError = true;
    } else if (houseName.isEmpty) {
      houseNameHasError = true;
    } else {
      houseNameHasError = false;
    }
  } while (houseNameHasError);

  // house color
  String? houseColor;
  bool houseColorHasError = false;
  do {
    print(houseColorHasError
        ? "Invalid Input! Re-enter house color"
        : "Enter house color");
    houseColor = stdin.readLineSync();
    if (houseColor == null) {
      houseColorHasError = true;
    } else if (houseColor.isEmpty) {
      houseColorHasError = true;
    } else {
      houseColorHasError = false;
    }
  } while (houseColorHasError);

  // house description
  String? houseDescription;
  bool houseDescriptionHasError = false;
  do {
    print(houseDescriptionHasError
        ? "Invalid Input! Re-enter house description"
        : "Enter house description");
    houseDescription = stdin.readLineSync();
    if (houseDescription == null) {
      houseDescriptionHasError = true;
    } else if (houseDescription.isEmpty) {
      houseDescriptionHasError = true;
    } else {
      houseDescriptionHasError = false;
    }
  } while (houseDescriptionHasError);

  // house price
  String? housePrice;
  RegExp regExp = RegExp(r'^\d+$');
  bool housePriceHasError = false;
  do {
    print(houseDescriptionHasError
        ? "Invalid Input! Re-enter house price"
        : "Enter house price");
    housePrice = stdin.readLineSync();
    if (housePrice == null) {
      housePriceHasError = true;
    } else if (housePrice.isEmpty) {
      housePriceHasError = true;
    } else if (!regExp.hasMatch(housePrice)) {
      housePriceHasError = true;
    } else {
      housePriceHasError = false;
    }
  } while (housePriceHasError);

  // house Type

  List<String> houseTypes = HouseType.values.map((_) {
    return _.toString();
  }).toList();
  int? houseTypeIndex;
  bool houseTypeIndexHasError = false;

  do {
    int i = 0;
    print(
        houseTypeIndexHasError ? "Invalid Input. Select one:" : "Select one:");
    print(
        houseTypeIndexHasError ? "Invalid Input. Select one:" : "Select one:");
    for (var type in houseTypes) {
      i++;
      print("$i: ${type.replaceRange(0, 10, '')}");
    }
    String? houseTypeIndexString = stdin.readLineSync();
    if (houseTypeIndexString != null) {
      if (!RegExp(r'^\d+$').hasMatch(houseTypeIndexString)) {
        houseTypeIndexHasError = true;
      } else {
        houseTypeIndex = int.parse(houseTypeIndexString) - 1;
        if (houseTypeIndex >= houseTypes.length || houseTypeIndex < 0) {
          houseTypeIndexHasError = true;
        } else {
          houseTypeIndexHasError = false;
        }
      }
    } else {
      houseTypeIndexHasError = true;
    }
  } while (houseTypeIndexHasError);

  currentProduct = Houses(
    name: houseName!,
    color: houseColor!,
    price: housePrice!,
    description: houseDescription!,
    houseType: HouseType.values[houseTypeIndex!],
  );

  print("House Created Successfully!\n"
      "Specifications:\n"
      "House name: ${currentProduct.name}\n"
      "House color: ${currentProduct.color}\n"
      "House price: ₦${currentProduct.price}\n"
      "House description: ${currentProduct.description}.\n"
      "'${currentProduct.houseType.toString().replaceRange(0, 10, '')}'.");
}

createCustomProduct() {
  // get product name
  String? productName;
  bool productNameHasError = false;
  do {
    print(productNameHasError
        ? "Invalid Input! Re-enter product name"
        : "Enter product name");
    productName = stdin.readLineSync();
    if (productName == null || productName.isEmpty) {
      productNameHasError = true;
    } else {
      productNameHasError = false;
    }
  } while (productNameHasError);

  String? productColor;
  bool productColorHasError = false;
  do {
    print(productColorHasError
        ? "Invalid Input! Re-enter product color"
        : "Enter product color");
    productColor = stdin.readLineSync();
    if (productColor == null) {
      productColorHasError = true;
    } else if (productColor.isEmpty) {
      productColorHasError = true;
    } else {
      productColorHasError = false;
    }
  } while (productColorHasError);

  // Get product description
  String? productDescription;
  bool productDescriptionHasError = false;
  do {
    print(productDescriptionHasError
        ? "Invalid Input! Re-enter product description"
        : "Enter product description");
    productDescription = stdin.readLineSync();
    if (productDescription == null || productDescription.isEmpty) {
      productDescriptionHasError = true;
    } else {
      productDescriptionHasError = false;
    }
  } while (productDescriptionHasError);

  // Get product price
  String? productPrice;
  RegExp regExp = RegExp(r'^\d+$');
  bool productPriceHasError = false;
  do {
    print(productPriceHasError
        ? "Invalid Input! Re-enter product price"
        : "Enter product price");
    productPrice = stdin.readLineSync();
    if (productPrice == null ||
        productPrice.isEmpty ||
        !regExp.hasMatch(productPrice)) {
      productPriceHasError = true;
    } else {
      productPriceHasError = false;
    }
  } while (productPriceHasError);

  currentProduct = CustomProduct(
    name: productName!,
    color: productColor!,
    price: productPrice!,
    description: productDescription!,
  );

  // Display the created product
  print("Custom Product Created Successfully!\n"
      "Specifications:\n"
      "Product name: ${currentProduct.name}\n"
      "Product description: ${currentProduct.description}\n"
      "Product price: ₦${currentProduct.price}\n");
}

void displayProducts() {
  print("${shopName?.toUpperCase()}\n");
  print("Address: $address");
  print("Products");

  for (var i = 0; i < products.length; i++) {
    print("${i + 1}: ${products[i].name}");
  }

  print("Select number to view product or press [Enter] to end program");
  RegExp regExp = RegExp(r'^\d+$');
  String? number = stdin.readLineSync();
  if (number != null && regExp.hasMatch(number)) {
    var thisProduct = products[int.parse(number)];
    if (thisProduct is Cars) {
      print(
          "Car name: ${thisProduct.name}\nCar color: ${thisProduct.color}\nCar price: ₦${thisProduct.price}\n${thisProduct.description}.\n '${thisProduct.carBrand.toString().replaceRange(0, 9, '')}'••••••'${thisProduct.carType.toString().replaceRange(0, 8, '')}'.");
    } else if (thisProduct is Clothing) {
      print(
        (
          "Clothing name: ${thisProduct.name}\n"
              "Clothing color: ${thisProduct.color}\n"
              "Clothing price: ₦${thisProduct.price}\n"
              "${thisProduct.description}.\n'${thisProduct.brand.toString().replaceRange(0, 6, '')}'********'${currentProduct.size.toString().replaceRange(0, 6, '')}'.",
        ),
      );
    } else if (thisProduct is Houses) {
      print(
        "House name: ${thisProduct.name}\n"
        "House color: ${thisProduct.color}\n"
        "House price: ₦${thisProduct.price}\n"
        "House description: ${thisProduct.description}.\n"
        "'${thisProduct.houseType.toString().replaceRange(0, 10, '')}'.",
      );
    } else if (thisProduct is CustomProduct) {
      print(
        "Product name: ${thisProduct.name}\n"
        "Product description: ${thisProduct.description}\n"
        "Product price: ₦${thisProduct.price}\n",
      );
    }

    print("OTHERS");
    for (var i = 0; i < products.length; i++) {
      print("${i + 1}: ${products[i].name}");
    }
  }
}
