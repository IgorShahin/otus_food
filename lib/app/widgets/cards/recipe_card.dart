import 'package:flutter/material.dart';
import 'package:otus_food/app/model/recipe_info.dart';
import 'package:otus_food/common/widgets/app_image.dart';

import '../../../common/res/app_assets.dart';
import '../../../common/res/app_colors.dart';
import '../../../common/res/app_dimen.dart';

class RecipeCard extends StatelessWidget {
  final RecipeInfo recipeInfo;
  final VoidCallback onTap;

  const RecipeCard({super.key, required this.recipeInfo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
            left: AppDimen.small,
            right: AppDimen.small,
            bottom: AppDimen.medium),
        // width: AppDimen.cardWidth,
        height: 136,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppDimen.cardRadius)),
        child: Row(
          children: [
            AppImage(
              recipeInfo.image,
              fit: BoxFit.fill,
              width: 149,
              height: 136,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, top: 30, right: 23, bottom: 23),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        recipeInfo.title,
                        style: const TextStyle(
                          fontSize: 22,
                          height: 1,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(width: 23),
                    Row(
                      children: [
                        const AppImage(
                          AppImages.iconTime,
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 11),
                        Text(
                          recipeInfo.time,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.green),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
