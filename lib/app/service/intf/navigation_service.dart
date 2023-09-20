import 'package:otus_food/app/model/recipe_info.dart';

import '../../app_route.dart';

abstract class NavigationService {
  void back<T>({T? result});

  Future<T?>? navigateToRoute<T>(AppRoute route,
      {bool replace = false, bool off = false, Object? arguments});

  Future<void> toHomePage();

  Future<void> toRecipePage(RecipeInfo recipeInfo);
}
