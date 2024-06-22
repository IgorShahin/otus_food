import 'package:flutter/material.dart';
import 'package:otus_food/core/res/app_colors.dart';

class CardLoading extends StatelessWidget {
  const CardLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 396,
      height: 136,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black12,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withAlpha(10),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
    );
  }
}
