import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class ProfileTabInfoListItem extends StatelessWidget {
  final String? description;
  final Widget? customDescriptionWidget;
  final String imagePath;
  const ProfileTabInfoListItem({
    Key? key,
    required this.imagePath,
    this.description,
    this.customDescriptionWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 9,
      ),
      margin: const EdgeInsets.only(
        bottom: 16,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Palette.grey,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 29,
            height: 29,
            child: Image.asset(imagePath),
          ),
          const SizedBox(
            width: 12,
          ),
          customDescriptionWidget ??
              Text(
                description ?? "",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
        ],
      ),
    );
  }
}
