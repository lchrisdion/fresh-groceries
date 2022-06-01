import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:klik_daily/app/models/product_type_model.dart';
import 'package:klik_daily/app/repo/user_respository.dart';
import 'package:klik_daily/get_storage_service.dart';

import '../../../models/cart_product_model.dart';
import '../../../models/user_info_model.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final UserRepository userRepository = UserRepository();
  final currentTabIndex = 0.obs;
  final selectedCategory = 0.obs;
  final userInfo = UserInfo().obs;
  final defaultProductTypeList = List<ProductType>.empty(growable: true).obs;
  final productTypeList = List<ProductType>.empty(growable: true).obs;
  final cartItems = List<CartProductModel>.empty(growable: true).obs;
  late final TextEditingController searchTextFieldController =
      TextEditingController();
  final GeneralGetStorageService getStorageService = Get.find();
  final cartTotalItems = 0.obs;
  final cartTotalPrice = 0.obs;
  final isFetching = true.obs;
  final searchValue = "".obs;
  late Worker searchWorker = debounce(searchValue, (_) async {
    if (searchValue.value.isNotEmpty) {
      var searchResult = defaultProductTypeList[selectedCategory.value]
          .products
          ?.where((product) {
            return product.name!
                .toLowerCase()
                .contains(searchValue.value.toLowerCase());
          })
          .map((e) => e)
          .toList();
      var result = ProductType(
          typeName: defaultProductTypeList[selectedCategory.value].typeName,
          products: searchResult);
      productTypeList[selectedCategory.value] = result;
    } else {
      await getFruitList();
    }
  });
  @override
  void onInit() async {
    super.onInit();
    await firstLoad();
    searchWorker = searchWorker;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  firstLoad() async {
    isFetching.value = true;
    await getFruitList();
    initCartItems();
    await getUserData();
    isFetching.value = false;
  }

  getFruitList() async {
    try {
      var data = await rootBundle.loadString('assets/models/fruit_list.json');
      var jsonResult = json.decode(data);
      var response =
          (jsonResult as List).map((e) => ProductType.fromJson(e)).toList();
      defaultProductTypeList.assignAll(response);
      productTypeList.assignAll(response);
    } catch (e) {}
  }

  initCartItems() {
    try {
      if (getStorageService.savedCartItems.val.isNotEmpty) {
        var jsonDecode = json.decode(getStorageService.savedCartItems.val);
        var items = (jsonDecode as List)
            .map((e) => CartProductModel.fromJson(e))
            .toList();
        cartItems.assignAll(items);
      }
      countCartItems();
    } catch (e) {
      print(e);
    }
  }

  getUserData() async {
    try {
      var response = await userRepository.getUserInfo();
      userInfo.value = response.first;
    } catch (e) {
      print(e);
    }
  }

  addToCart(Product productType) {
    var cartProduct = CartProductModel(
      product: productType,
      quantity: 1,
    );
    cartItems.add(cartProduct);
    setCartLocalValue();
  }

  setCartLocalValue() {
    getStorageService.savedCartItems.val =
        cartItems.map((value) => value.toJson()).toList().toString();
  }

  countCartItems() {
    cartTotalItems.value = 0;
    cartTotalPrice.value = 0;
    cartItems.map((value) {
      cartTotalItems.value += value.quantity ?? 0;
      cartTotalPrice.value +=
          (value.product?.price ?? 0) * (value.quantity ?? 0);
    }).toList();
  }
}
