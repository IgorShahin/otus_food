import 'package:flutter/material.dart';
import 'package:otus_food/core/extensions/context_extension.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.titleAppBarNewRecipe),
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
}
