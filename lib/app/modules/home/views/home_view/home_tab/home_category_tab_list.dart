import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_daily/app/modules/home/controllers/home_controller.dart';

import '../../../../../ui/theme/app_colors.dart';

class HomeCategoryTabList extends GetView<HomeController> {
  const HomeCategoryTabList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        0,
        21,
        0,
        17,
      ),
      child: SizedBox(
        height: 49,
        child: Obx(
          () => ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 35,
            ),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: controller.productTypeList
                .asMap()
                .entries
                .map(
                  (e) => GestureDetector(
                    onTap: () {
                      Get.focusScope?.unfocus();
                      controller.searchValue.value = "";
                      controller.searchTextFieldController.text = "";
                      controller.selectedCategory.value = e.key;
                    },
                    child: AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 250,
                      ),
                      width: 100,
                      height: 39,
                      margin: const EdgeInsets.only(
                        right: 27,
                      ),
                      decoration: BoxDecoration(
                        color: e.key == controller.selectedCategory.value
                            ? Palette.primary
                            : Color(0xFFE5E5E5),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        e.value.typeName?.capitalizeFirst ?? "",
                        style: TextStyle(
                          color: e.key == controller.selectedCategory.value
                              ? Colors.white
                              : Color(0xFFA09B9B),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
