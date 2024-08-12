import 'package:flutter/material.dart';
import 'package:otus_food/core/extensions/context_extension.dart';
import 'package:otus_food/core/widgets/button/outline_button.dart';
import 'package:otus_food/core/widgets/button/primary_button.dart';
import 'package:otus_food/features/recipes/presentation/widgets/add_images.dart';
import 'package:otus_food/features/recipes/presentation/widgets/app_text_field.dart';

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
              style: const TextStyle(
                color: Color(0xFF165932),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 9),
            buildIngredients(context),
            const SizedBox(height: 19),
            Text(
              context.l10n.steps,
              style: const TextStyle(
                color: Color(0xFF165932),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            buildSteps(context),
          ],
        ),
      );

  Center buildIngredients(BuildContext context) => Center(
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
              onPressed: () => _showNewIngredientDialog(context),
            ),
          ],
        ),
      );

  Center buildSteps(BuildContext context) => Center(
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
              onPressed: () => _showNewStepDialog(context),
            ),
            const SizedBox(height: 21),
            PrimaryButton(
              title: context.l10n.saveRecipe,
              onPressed: () {},
              isEnabled: false,
            ),
          ],
        ),
      );

  void _showNewIngredientDialog(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(context.l10n.ingredient),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppTextField(labelText: context.l10n.ingredientName),
              const SizedBox(height: 16),
              AppTextField(labelText: context.l10n.amount),
              const SizedBox(height: 50),
              PrimaryButton(
                title: context.l10n.add,
                onPressed: () {},
              ),
            ],
          ),
        ),
      );

  void _showEditIngredientDialog(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(context.l10n.ingredient),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppTextField(labelText: context.l10n.ingredientName),
              const SizedBox(height: 16),
              AppTextField(labelText: context.l10n.amount),
              const SizedBox(height: 50),
              PrimaryButton(
                title: context.l10n.add,
                onPressed: () {},
              ),
            ],
          ),
        ),
      );

  void _showNewStepDialog(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(context.l10n.step),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextField(labelText: context.l10n.stepDescription),
              const SizedBox(height: 8),
              Text(
                context.l10n.stepDuration,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8),
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FixedColumnWidth(8),
                  2: FlexColumnWidth(1),
                },
                children: [
                  TableRow(
                    children: [
                      AppTextField(
                        labelText: context.l10n.minutes,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox.shrink(),
                      AppTextField(
                        labelText: context.l10n.seconds,
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Center(
                child: PrimaryButton(
                  title: context.l10n.add,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      );

  void _showEditStepDialog(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(context.l10n.step),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextField(labelText: context.l10n.stepDescription),
              const SizedBox(height: 8),
              Text(
                context.l10n.stepDuration,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8),
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FixedColumnWidth(8),
                  2: FlexColumnWidth(1),
                },
                children: [
                  TableRow(
                    children: [
                      AppTextField(
                        labelText: context.l10n.minutes,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox.shrink(),
                      AppTextField(
                        labelText: context.l10n.seconds,
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Center(
                child: PrimaryButton(
                  title: context.l10n.add,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      );
}
