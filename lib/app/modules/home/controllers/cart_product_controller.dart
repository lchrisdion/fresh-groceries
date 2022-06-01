import 'package:get/get.dart';
import 'package:klik_daily/app/modules/home/controllers/home_controller.dart';

class CardProductController extends GetxController {
  final int cardIndex;
  final int defaultQuantity;
  CardProductController({
    required this.cardIndex,
    required this.defaultQuantity,
  });
  final HomeController homeController = Get.find();
  late final totalItems = defaultQuantity.obs;
  late Worker quantityDebounce = debounce(
    totalItems,
    (_) {
      homeController.cartItems[cardIndex].quantity = totalItems.value;
      homeController.countCartItems();
      homeController.setCartLocalValue();
    },
    time: Duration(
      milliseconds: 300,
    ),
  );
  @override
  void onInit() {
    super.onInit();
    quantityDebounce = quantityDebounce;
  }

  @override
  void onClose() {
    super.onClose();
    quantityDebounce.dispose();
  }

  incrementItems() {
    totalItems.value++;
  }

  decrementItems() {
    totalItems.value--;
  }
}
