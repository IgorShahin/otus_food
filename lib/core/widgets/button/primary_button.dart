import 'package:flutter/material.dart';
import 'package:otus_food/core/constants/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.color = AppColors.mainColor,
    this.isEnabled = true,
  });

  final String title;
  final VoidCallback? onPressed;
  final Color color;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          maximumSize: const Size(232, 48),
          foregroundColor: Colors.white,
          backgroundColor: isEnabled ? color : AppColors.mutedGray,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        child: SizedBox(
          width: 232,
          height: 48,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
}
