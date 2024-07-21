import 'package:flutter/material.dart';
import 'package:otus_food/core/widgets/base_container.dart';

class RecipeItemScreen extends StatelessWidget {
  const RecipeItemScreen({super.key});

  @override
  Widget build(BuildContext context) => const BaseContainer(
      child: Center(
        child: Text('Recipe item'),
      ),
    );
}
