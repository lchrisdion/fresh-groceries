import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GeneralGetStorageService extends GetxService {
  static final box = () => GetStorage();

  final savedCartItems = "".val(
    'CART',
    getBox: box,
  );
}
