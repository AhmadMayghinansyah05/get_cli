import 'package:get/get.dart';

import '../controllers/recipe_controller.dart';

class RecipesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecipeController>(
      () => RecipeController(),
    );
  }
}
