import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_daily/app/modules/home/views/home_view/home_bottom_bar.dart';
import 'package:klik_daily/app/modules/home/views/home_view/home_tab.dart';

import '../../../ui/theme/app_colors.dart';
import '../controllers/home_controller.dart';
import 'home_view/cart_tab.dart';
import 'home_view/profile_tab.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.focusScope?.unfocus();
      },
      child: Obx(
        () => Scaffold(
          backgroundColor: Colors.white,
          body: controller.isFetching.value
              ? Center(
                  child: SizedBox(
                    child: CircularProgressIndicator(
                      color: Palette.primary,
                    ),
                    height: 20,
                    width: 20,
                  ),
                )
              : SizedBox(
                  height: Get.height,
                  child: Obx(
                    () {
                      if (controller.currentTabIndex.value == 0)
                        return HomeTab();
                      else if (controller.currentTabIndex.value == 1)
                        return CartTab();
                      else if (controller.currentTabIndex.value == 2)
                        return ProfileTab();
                      return const SizedBox();
                    },
                  ),
                ),
          bottomNavigationBar: controller.isFetching.value
              ? const SizedBox()
              : const HomeBottomBar(),
        ),
      ),
    );
  }
}
