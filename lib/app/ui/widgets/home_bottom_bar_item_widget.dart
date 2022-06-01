import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_daily/app/modules/home/controllers/home_controller.dart';

import '../theme/app_colors.dart';

class HomeBottomBarItemWidget extends GetView<HomeController> {
  final int index;
  final String description;
  final String imagePath;
  final int totalNotif;
  const HomeBottomBarItemWidget({
    Key? key,
    required this.index,
    required this.description,
    required this.imagePath,
    this.totalNotif: 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.currentTabIndex.value = index;
      },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          SizedBox(
            width: 45,
            child: Obx(
              () => AnimatedContainer(
                duration: Duration(
                  milliseconds: 250,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: controller.currentTabIndex.value == index
                          ? Palette.primary
                          : Colors.white,
                      width: 4,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: 25,
                      height: 25,
                      child: Image.asset(imagePath),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedScale(
            curve: Curves.elasticOut,
            duration: Duration(milliseconds: 1000),
            scale: (totalNotif > 0) ? 1.0 : 0,
            child: Container(
              width: 17,
              height: 17,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Palette.primary,
              ),
              child: Center(
                child: Text(
                  '$totalNotif',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    height: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
