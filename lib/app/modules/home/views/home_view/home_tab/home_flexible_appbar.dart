import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_daily/app/modules/home/controllers/home_controller.dart';

import '../../../../../ui/theme/app_colors.dart';
import '../../../../../ui/widgets/global_network_image.dart';

class HomeFlexibleAppBar extends GetView<HomeController> {
  const HomeFlexibleAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Find ',
          style: TextStyle(
            color: Palette.accent,
            fontWeight: FontWeight.w400,
            fontSize: 24,
          ),
        ),
        Text(
          'Fresh Groceries',
          style: TextStyle(
            color: Palette.primary,
            fontWeight: FontWeight.w400,
            fontSize: 24,
          ),
        ),
        const Spacer(),
        Obx(
          () => ClipOval(
            child: SizedBox(
              width: 50,
              height: 50,
              child: GlobalNetworkImage(
                imageURL: controller.userInfo.value.picture?.large ?? "",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
