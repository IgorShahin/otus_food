import 'package:flutter/material.dart' hide Badge;
import 'package:flutter/material.dart';
import 'package:otus_food/common/res/app_assets.dart';
import 'package:otus_food/common/res/app_colors.dart';
import 'package:otus_food/common/res/app_styles.dart';
import 'package:otus_food/common/widgets/app_image.dart';

class AppBottomNavigationBarButton extends StatelessWidget {
  final AppImageData imageData;
  final VoidCallback? onPressed;
  final String label;
  final bool selected;

  const AppBottomNavigationBarButton({
    Key? key,
    this.onPressed,
    required this.imageData,
    required this.selected,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: const ButtonStyle(),
      child: Column(
        children: [
          AppImage(
            imageData,
            width: 24,
            height: 24,
            color: selected ? AppColors.green : AppColors.defaultColor,
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: Text(
              label,
              style: selected
                  ? AppStyles.s10.w400.green
                  : AppStyles.s10.w400.grey40,
            ),
          ),
        ],
      ),
    );
  }
}
