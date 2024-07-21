enum AppRoutes {
  auth('login', '/login'),
  recipes('recipes', '/recipes'),
  recipeItem('recipe_item', '/recipe_item'),
  addRecipe('add_recipe', '/add_recipe');

  final String name;
  final String path;

  const AppRoutes(this.name, this.path);
}
