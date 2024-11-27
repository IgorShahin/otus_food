import 'package:flutter/material.dart';
import 'package:otus_food/core/extensions/context_extension.dart';

import '../../../../core/widgets/button/primary_button.dart';
import '../../../../core/widgets/text_field/app_text_field.dart';

Future<void> addStepBottomSheet(BuildContext context) => showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      builder: (BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Wrap(
          runSpacing: 16,
          children: [
            Text(
              context.l10n.step,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
            AppTextField(
              labelText: context.l10n.stepDescription,
              keyboardType: TextInputType.multiline,
            ),
            Text(
              context.l10n.stepDuration,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
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
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 30),
              child: Center(
                child: PrimaryButton(
                  title: context.l10n.add,
                  color: context.colors.accentColor,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );

Future<void> editStepBottomSheet(BuildContext context) => showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      builder: (BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Wrap(
          runSpacing: 16,
          children: [
            Text(
              context.l10n.step,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
            AppTextField(
              labelText: context.l10n.stepDescription,
              keyboardType: TextInputType.multiline,
            ),
            Text(
              context.l10n.stepDuration,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
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
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 30),
              child: Center(
                child: PrimaryButton(
                  title: context.l10n.save,
                  color: context.colors.accentColor,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );

Future<void> addIngredientBottomSheet(BuildContext context) =>
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      builder: (BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Wrap(
          runSpacing: 16,
          children: [
            Text(
              context.l10n.ingredient,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
            AppTextField(labelText: context.l10n.ingredientName),
            AppTextField(labelText: context.l10n.amount),
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 30),
              child: Center(
                child: PrimaryButton(
                  title: context.l10n.add,
                  color: context.colors.accentColor,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );

Future<void> editIngredientBottomSheet(BuildContext context) =>
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      builder: (BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Wrap(
          runSpacing: 16,
          children: [
            Text(
              context.l10n.ingredient,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
            AppTextField(labelText: context.l10n.ingredientName),
            AppTextField(labelText: context.l10n.amount),
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 30),
              child: Center(
                child: PrimaryButton(
                  title: context.l10n.save,
                  color: context.colors.accentColor,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
