import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../ui/theme/app_colors.dart';
import '../../../../ui/widgets/home_bottom_bar_item_widget.dart';
import '../../controllers/home_controller.dart';

class HomeBottomBar extends GetView<HomeController> {
  const HomeBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Material(
        color: controller.currentTabIndex.value == 2
            ? Color(0xFFEFF3F6)
            : Colors.white,
        child: Container(
          width: double.infinity,
          height: 83,
          padding: const EdgeInsets.fromLTRB(
            23,
            17,
            23,
            13,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Palette.grey,
            ),
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeBottomBarItemWidget(
                description: 'Home',
                imagePath: 'assets/images/home.png',
                index: 0,
              ),
              Obx(
                () => HomeBottomBarItemWidget(
                  description: 'Cart',
                  imagePath: 'assets/images/cart.png',
                  index: 1,
                  totalNotif: controller.cartItems.length,
                ),
              ),
              HomeBottomBarItemWidget(
                description: 'Profile',
                imagePath: 'assets/images/profile.png',
                index: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
