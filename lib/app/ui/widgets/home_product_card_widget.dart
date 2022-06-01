import 'package:flutter/material.dart';
import 'package:klik_daily/app/ui/widgets/global_network_image.dart';

import '../helper/ui_helper.dart';
import '../theme/app_colors.dart';

class HomeProductCardWidget extends StatelessWidget {
  final bool isLast;
  final String name;
  final int price;
  final String imageUrl;
  final int rating;
  final Function()? onTap;
  const HomeProductCardWidget({
    Key? key,
    required this.isLast,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.rating,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: isLast ? 26 : 10,
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 14,
      ),
      height: 105,
      decoration: BoxDecoration(
        border: Border.all(color: Palette.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              10,
            ),
            child: SizedBox(
              width: 78,
              height: 78,
              child: GlobalNetworkImage(
                imageURL: imageUrl,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  '${UIHelper.convertToIdr(price)}/kg',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF7D7777),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 9,
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
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: onTap,
              child: Text(
                'Buy',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Palette.primary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
