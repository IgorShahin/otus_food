import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otus_food/app/model/recipe_info.dart';
import 'package:otus_food/app/service/impl/navigation_service_impl.dart';
import 'package:otus_food/common/widgets/base_page/base_page_controller.dart';

class HomePageController extends BasePageController {
  HomePageController() : super(tag: "HomePageController");

  final recipe = Rxn<RecipeInfo>();
  final loginFlag = false.obs;

  Future<void> onCardRecipePressed(
      BuildContext context, RecipeInfo recipeInfo) async {
    context.navigation.toRecipePage(recipeInfo);
  }
}
