import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../modules/home/controllers/cart_product_controller.dart';
import '../helper/ui_helper.dart';
import '../theme/app_colors.dart';
import 'global_network_image.dart';

class CartCardWidget extends GetView<CardProductController> {
  @override
  final String tag;
  final bool isLast;
  final String name;
  final int price;
  final int quantity;
  final String imageUrl;
  final int rating;
  final Function()? onDelete;
  CartCardWidget({
    Key? key,
    required this.tag,
    required this.isLast,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.quantity,
    this.onDelete,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: isLast ? 0 : 10,
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(
        19,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Palette.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                onTap: onDelete,
                child: Container(
                  height: 26,
                  width: 28,
                  decoration: BoxDecoration(
                    color: Color(
                      0xFFEFF3F6,
                    ),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/delete.svg',
                    height: 26,
                    width: 28,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 23,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        child: SizedBox(
                          width: 58,
                          height: 58,
                          child: GlobalNetworkImage(
                            imageURL: imageUrl,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 21,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            '${UIHelper.convertToIdr(price)}/kg',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: List.generate(
                              rating,
                              (index) {
                                return Icon(
                                  Icons.star,
                                  size: 19,
                                  color: Palette.accent,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Obx(
                      () => GestureDetector(
                        onTap: controller.totalItems.value > 1
                            ? controller.decrementItems
                            : null,
                        child: Container(
                          height: 24,
                          width: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Palette.primary,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '-',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: Obx(
                        () => Text(
                          controller.totalItems.value.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: controller.incrementItems,
                      child: Container(
                        height: 24,
                        width: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Palette.primary,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '+',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
