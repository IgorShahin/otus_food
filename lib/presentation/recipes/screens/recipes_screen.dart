import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:otus_food/config/router/app_routes.dart';
import 'package:otus_food/core/res/app_colors.dart';
import 'package:otus_food/core/widgets/base_container.dart';
import 'package:otus_food/presentation/recipes/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

import '../bloc/recipes_bloc.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      child: BlocBuilder<RecipesBloc, RecipesState>(
        builder: (context, state) {
          if (state is RecipesLoading) {
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
          } else if (state is RecipesError) {
            return const Center(child: FailureContainer());
          } else {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => index == 0
                  ? Padding(
                      padding: const EdgeInsets.only(top: 45),
                      child: CardRecipe(
                        onTap: () => context.push(AppRoutes.recipeItem.path),
                        image: state.recipes![index].photoUrl!,
                        name: state.recipes![index].name!,
                        time: state.recipes![index].duration!,
                      ),
                    )
                  : CardRecipe(
                      onTap: () => context.push(AppRoutes.recipeItem.path),
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
    );
  }
}
