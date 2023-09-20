import 'package:flutter/material.dart';
import 'package:otus_food/app/model/recipe_info.dart';
import 'package:otus_food/app/pages/home/home_page_controller.dart';
import 'package:otus_food/common/widgets/app_get_builder.dart';
import 'package:otus_food/common/widgets/scaffold/app_scaffold.dart';

import '../../widgets/bottom_navigation_bar/app_bottom_navigation_bar.dart';
import '../../widgets/cards/recipe_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppGetBuilder<HomePageController>(
        controller: () => HomePageController(),
        builder: (controller) {
          return AppScaffold(
            bottomNavigationBar:
                const AppBottomNavigationBar(selectedIndex: 0),
            body: ListView.builder(
              itemCount: RecipeInfo.mocked.length,
              itemBuilder: (context, index) => RecipeCard(
                recipeInfo: RecipeInfo.mocked[index],
                onTap: () {
                  controller.onCardRecipePressed(
                      context, RecipeInfo.mocked[index]);
                },
              ),
            ),
          );
        });
  }
}
