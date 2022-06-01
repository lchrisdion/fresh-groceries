import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_daily/app/modules/home/controllers/home_controller.dart';
import 'package:klik_daily/app/modules/home/views/home_view/profile_tab/profiel_tab_info_list.dart';
import 'package:klik_daily/app/modules/home/views/home_view/profile_tab/profile_tab_header.dart';

import '../../../../ui/theme/app_colors.dart';

class ProfileTab extends GetView<HomeController> {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFEFF3F6),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            titleSpacing: 26,
            pinned: true,
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            backgroundColor: Palette.primary,
            elevation: 0,
            toolbarHeight: 93,
          ),
          SliverToBoxAdapter(
            child: const ProfileTabHeader(),
          ),
          SliverToBoxAdapter(
            child: const ProfileTabInfoList(),
          ),
        ],
      ),
    );
  }
}
