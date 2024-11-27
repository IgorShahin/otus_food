import 'package:flutter/material.dart';
import 'package:otus_food/core/extensions/context_extension.dart';
import 'package:otus_food/core/widgets/button/outline_button.dart';
import 'package:otus_food/core/widgets/button/primary_button.dart';
import 'package:otus_food/core/widgets/text_field/app_text_field.dart';
import 'package:otus_food/features/recipes/presentation/widgets/add_recipe/add_images.dart';
import 'package:otus_food/features/recipes/utlis/recipe_bottom_sheet.dart';

import '../../../../../core/widgets/base_container.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  @override
  Widget build(BuildContext context) => BaseContainer(
        backgroundColor: Colors.white,
        isScrollable: true,
        appBar: AppBar(
          title: Text(
            context.l10n.titleAppBarNewRecipe,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 17),
            AppTextField(labelText: context.l10n.recipeTitle),
            const SizedBox(height: 17),
            const AddImages(),
            const SizedBox(height: 18),
            Text(
              context.l10n.ingredients,
              style: TextStyle(
                color: context.colors.mainColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 9),
            buildIngredients(context),
            const SizedBox(height: 19),
            Text(
              context.l10n.steps,
              style: TextStyle(
                color: context.colors.mainColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 9),
            buildSteps(context),
          ],
        ),
      );

  Widget buildIngredients(BuildContext context) => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              context.l10n.noIngredients,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 21),
            OutlineButton(
              title: context.l10n.addIngredient,
              onPressed: () => addIngredientBottomSheet(context),
            ),
          ],
        ),
      );

  Widget buildSteps(BuildContext context) => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              context.l10n.noSteps,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 21),
            OutlineButton(
              title: context.l10n.addStep,
              onPressed: () => addStepBottomSheet(context),
            ),
            const SizedBox(height: 21),
            PrimaryButton(
              title: context.l10n.saveRecipe,
              color: context.colors.accentColor,
              onPressed: () {},
              isEnabled: false,
            ),
          ],
        ),
      );
}
