import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli/app/modules/recipes/controllers/recipe_controller.dart';
import 'package:get_cli/app/modules/recipes/views/recipe_detail_view.dart';

class RecipeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RecipeController controller = Get.find();

    return Scaffold(
      appBar: AppBar(title: Text('Recipes')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.recipes.isEmpty) {
          return Center(child: Text('No recipes found.'));
        }

        return ListView.builder(
          itemCount: controller.recipes.length,
          itemBuilder: (context, index) {
            final recipe = controller.recipes[index];
            return ListTile(
              leading: Image.network(recipe.photoUrl, width: 50, height: 50, fit: BoxFit.cover),
              title: Text(recipe.title),
              subtitle: Text(recipe.description),
              onTap: () => Get.to(() => RecipeDetailView(recipeId: recipe.id)),
            );
          },
        );
      }),
    );
  }
}
