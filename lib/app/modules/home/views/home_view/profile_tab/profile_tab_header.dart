import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_daily/app/modules/home/controllers/home_controller.dart';

import '../../../../../ui/widgets/global_network_image.dart';

class ProfileTabHeader extends GetView<HomeController> {
  const ProfileTabHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 193,
                decoration: BoxDecoration(
                  color: Color(0xFFEFF3F6),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 124,
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(
              11.5,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Obx(
              () => ClipOval(
                child: SizedBox(
                  width: 145,
                  height: 145,
                  child: GlobalNetworkImage(
                    imageURL: controller.userInfo.value.picture?.large ?? "",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
