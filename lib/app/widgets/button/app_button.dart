import 'package:flutter/material.dart';
import 'package:otus_food/common/res/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.title, required this.onPressed});

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 232,
      height: 48,
      decoration: ShapeDecoration(
        color: AppColors.greenShade,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: Center(
        child: GestureDetector(
          onTap: onPressed,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              height: 1.44,
            ),
          ),
        ),
      ),
    );
  }
}
