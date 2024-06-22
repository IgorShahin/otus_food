import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:otus_food/config/route/app_routes.dart';
import 'package:otus_food/core/widgets/base_container.dart';
import 'package:otus_food/presentation/recipes/widgets/card_loading.dart';
import 'package:otus_food/presentation/recipes/widgets/card_recipe.dart';
import 'package:otus_food/presentation/recipes/widgets/failure_container.dart';
import 'package:shimmer/shimmer.dart';

import '../../../injection_container.dart';
import '../bloc/recipes_bloc.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      child: BlocProvider(
        create: (context) => sl<RecipesBloc>()..add(GetRecipes()),
        child: BlocBuilder<RecipesBloc, RecipesState>(
          builder: (context, state) {
            if (state is RecipesLoading) {
              return Shimmer.fromColors(
                baseColor: Colors.black12,
                highlightColor: Colors.white,
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
            } else if (state is RecipesError) {
              return const Center(child: FailureContainer());
            } else {
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) => index == 0
                    ? Padding(
                        padding: const EdgeInsets.only(top: 45),
                        child: CardRecipe(
                          onTap: () => context.push(AppRoute.recipeItem.path),
                          image: state.recipes![index].photoUrl!,
                          name: state.recipes![index].name!,
                          time: state.recipes![index].duration!,
                        ),
                      )
                    : CardRecipe(
                        onTap: () => context.push(AppRoute.recipeItem.path),
                        image: state.recipes![index].photoUrl!,
                        name: state.recipes![index].name!,
                        time: state.recipes![index].duration!,
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
}
