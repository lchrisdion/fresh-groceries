import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:klik_daily/app/modules/home/controllers/home_controller.dart';

import '../../../../../ui/theme/app_colors.dart';

class HomeSearchTextField extends GetView<HomeController> {
  const HomeSearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49,
      margin: EdgeInsets.fromLTRB(
        35,
        24,
        35,
        20,
      ),
      width: double.infinity,
      child: TextField(
        controller: controller.searchTextFieldController,
        textAlignVertical: TextAlignVertical.center,
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.zero,
          prefixIcon: Padding(
            padding: EdgeInsets.all(14),
            child: SvgPicture.asset(
              "assets/images/search.svg",
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.grey, width: 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.grey, width: 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: 'Search Groceries',
          hintStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Color(0xFFC3BFBF),
          ),
        ),
        onChanged: (searchInput) async {
          controller.searchValue.value = searchInput;
        },
      ),
    );
  }
}
