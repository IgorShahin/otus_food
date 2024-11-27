import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:otus_food/core/constants/colors.dart';
import 'package:otus_food/core/extensions/extensions.dart';
import 'package:otus_food/core/router/app_routes.dart';
import 'package:otus_food/core/utils/custom_status.dart';
import 'package:otus_food/core/widgets/base_container.dart';
import 'package:otus_food/features/recipes/presentation/bloc/list_recipes/list_recipes_bloc.dart';
import 'package:otus_food/features/recipes/presentation/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.push(AppRoutes.addRecipe.path),
          backgroundColor: context.colors.accentColor,
          child: const Icon(Icons.add),
        ),
        body: BaseContainer(
          child: BlocBuilder<ListRecipesBloc, ListRecipesState>(
            builder: (context, state) {
              if (state.status.isLoading) {
                return Shimmer.fromColors(
                  baseColor: AppColors.base,
                  highlightColor: AppColors.base.withAlpha(10),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => index == 0
                        ? const Padding(
                            padding: EdgeInsets.only(top: 45),
                            child: CardLoading(),
                          )
                        : const CardLoading(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 24),
                    itemCount: 4,
                  ),
                );
              } else if (state.status.isError) {
                return const Center(child: FailureContainer());
              } else {
                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) => index == 0
                      ? Padding(
                          padding: const EdgeInsets.only(top: 45),
                          child: CardRecipe(
                            onTap: () => context.push(
                              AppRoutes.recipeItem.path,
                              extra: state.recipes![index],
                            ),
                            image: state.recipes![index].photoUrl,
                            name: state.recipes![index].name,
                            time: state.recipes![index].duration,
                          ),
                        )
                      : CardRecipe(
                          onTap: () => context.push(
                            AppRoutes.recipeItem.path,
                            extra: state.recipes![index],
                          ),
                          image: state.recipes![index].photoUrl,
                          name: state.recipes![index].name,
                          time: state.recipes![index].duration,
                        ),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 24),
                  itemCount: state.recipes!.length,
                );
              }
            },
          ),
        ),
      );
}
