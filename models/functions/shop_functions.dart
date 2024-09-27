import 'dart:io';

import '../shop_model.dart';

// variables
String? shopName;
String? address;
// create shop function
Shop? createShop() {
  bool isNameFetched = getShopName();
  bool isAddressFetched = getAddress();

  if (isNameFetched && isAddressFetched) {
    final thisShop = Shop(name: shopName!, address: address!);
    return thisShop;
  } else {
    return null;
  }
}

// getShopName
bool getShopName() {
  bool shopNameHasError = false;
  do {
    print(shopNameHasError
        ? "Invalid input! Re-enter shop name"
        : "Enter shop name:");
    shopName = stdin.readLineSync();
    if (shopName != null) {
      if (shopName!.isEmpty) {
        shopNameHasError = true;
      } else {
        shopNameHasError = false;
      }
    } else {
      shopNameHasError = true;
    }
  } while (shopNameHasError);
  return !shopNameHasError;
}

// getShopAddress
bool getAddress() {
  bool shopAddressHasError = false;
  do {
    print(shopAddressHasError
        ? "Invalid input! Re-enter shop address"
        : "Enter shop address:");
    address = stdin.readLineSync();
    if (address != null) {
      if (address!.isEmpty) {
        shopAddressHasError = true;
      } else {
        shopAddressHasError = false;
      }
    } else {
      shopAddressHasError = true;
    }
  } while (shopAddressHasError);
  return !shopAddressHasError;
}
