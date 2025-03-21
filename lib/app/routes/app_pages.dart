import 'package:get/get.dart';
import 'package:get_cli/app/modules/recipes/views/recipe_detail_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/recipes/bindings/recipe_binding.dart';
import '../modules/recipes/views/recipe_list_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.RECIPES,
      page: () => RecipeListView(),
      binding: RecipesBinding(),
    ),
    GetPage(
      name: Routes.RECIPES,
      page: () => RecipeDetailView(recipeId: Get.arguments),
    ),
  ];
}
