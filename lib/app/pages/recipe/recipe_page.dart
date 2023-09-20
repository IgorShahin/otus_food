import 'package:flutter/material.dart';
import 'package:otus_food/app/model/recipe_info.dart';
import 'package:otus_food/app/pages/recipe/recipe_page_controller.dart';
import 'package:otus_food/app/widgets/button/app_button.dart';
import 'package:otus_food/common/extensions.dart';
import 'package:otus_food/common/res/app_assets.dart';
import 'package:otus_food/common/res/app_colors.dart';
import 'package:otus_food/common/widgets/app_get_builder.dart';
import 'package:otus_food/common/widgets/app_image.dart';
import 'package:otus_food/common/widgets/scaffold/app_app_bar.dart';
import 'package:otus_food/common/widgets/scaffold/app_scaffold.dart';

import '../../../common/res/app_dimen.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as RecipeInfo;
    return AppGetBuilder<RecipePageController>(
      controller: () => RecipePageController(),
      builder: (controller) {
        return AppScaffold(
          appBar: AppAppBar(
            title: context.l10n.recipe,
            showBackButton: true,
            showDoneButton: true,
            doneButtonWidget: const AppImage(AppImages.iconMegaphone),
          ),
          body: ListView(
            children: [
              Container(
                color: AppColors.white,
                padding: const EdgeInsets.only(left: 15, right: 15, top: 27.6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      args.title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 24),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const AppImage(
                          AppImages.iconTime,
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 11),
                        Text(
                          args.time,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.green),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppDimen.cardRadius)),
                      child: AppImage(
                        args.image,
                        fit: BoxFit.fill,
                        width: 396,
                        height: 220,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      context.l10n.ingredients,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.greenShade),
                    ),
                    const SizedBox(height: 18),
                    Container(
                      width: 395,
                      height: 330,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppDimen.cardRadius),
                        border: Border.all(
                            color: AppColors.borderIngredients, width: 3.0),
                      ),
                    ),
                    const SizedBox(height: 19),
                    Text(
                      context.l10n.cookingSteps,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.greenShade),
                    ),
                    const SizedBox(height: 19),
                    Center(
                      child: AppButton(
                          title: context.l10n.startCooking, onPressed: () {}),
                    ),
                    const SizedBox(height: 81)
                    // ListView.builder(
                    //   itemBuilder: (context, index) => Container(
                    //     // width: 398,
                    //     // height: 120,
                    //     decoration: BoxDecoration(
                    //       color: AppColors.backgroundCardRecipe,
                    //       borderRadius:
                    //           BorderRadius.circular(AppDimen.cardRadius),
                    //     ),
                    //   ),
                    //   // separatorBuilder: (context, index) => const SizedBox(),
                    //   itemCount: 7,
                    // )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
