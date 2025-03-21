import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import '../models/recipe_model.dart';

class RecipeController extends GetxController {
  final box = GetStorage();
  var recipes = <Recipe>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchRecipes();
    super.onInit();
  }

  Future<void> fetchRecipes() async {
    isLoading.value = true;
    try {
      var token = box.read('token');
      var response = await Dio().get(
        'https://recipe.incube.id/api/recipes',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200 && response.data['status'] == 'success') {
        var data = response.data['data']['data'] as List;
        recipes.assignAll(data.map((json) => Recipe.fromJson(json)).toList());
      } else {
        Get.snackbar('Error', response.data['message']);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch recipes');
    } finally {
      isLoading.value = false;
    }
  }
}
