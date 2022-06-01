import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_daily/app/modules/home/controllers/home_controller.dart';

import '../../../../../ui/widgets/profile_tab_info_list_item_widget.dart';

class ProfileTabInfoList extends GetView<HomeController> {
  const ProfileTabInfoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFEFF3F6),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 35,
          vertical: 56,
        ),
        child: Column(
          children: [
            ProfileTabInfoListItem(
              description: controller.userInfo.value.name?.first ?? "",
              imagePath: 'assets/images/id-card.png',
            ),
            ProfileTabInfoListItem(
              description: controller.userInfo.value.email ?? "",
              imagePath: 'assets/images/email.png',
            ),
            ProfileTabInfoListItem(
              description: controller.userInfo.value.phone ?? "",
              imagePath: 'assets/images/phone.png',
            ),
            ProfileTabInfoListItem(
              imagePath: 'assets/images/location.png',
              customDescriptionWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.userInfo.value.location?.street?.name ?? "",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    (controller.userInfo.value.location?.city ?? "") +
                        (" - " +
                            (controller.userInfo.value.location?.postcode ??
                                "")),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
