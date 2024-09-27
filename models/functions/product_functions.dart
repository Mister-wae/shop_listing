import 'dart:io';

import '../cars_model.dart';

var currentProduct;
int? selectedIndex;

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

  print("Do you wish to create another product?[yes/no]");
  String? response = stdin.readLineSync();
  if (response == "yes") {
    createProduct();
  } else {
    // create a function to display user's shop
    // displayShop();
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
  print("clothing created");
}

createHouseProduct() {
  print("house created");
}

createCustomProduct() {
  print("custom created");
}
