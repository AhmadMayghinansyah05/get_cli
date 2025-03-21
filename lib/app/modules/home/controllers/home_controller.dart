import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:get_cli/app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  var isLoading = false.obs;

  Future<void> logout() async {
    isLoading.value = true;
    try {
      var token = box.read('1241|N9LxurxDYRMqiaXxlZ5k4RJ24BO9XvLOT6q2fosde5cc61a4');
      var response = await Dio().post(
        'https://recipe.incube.id/api/logout',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        box.erase();
        Get.offAllNamed(Routes.LOGIN);
      } else {
        Get.snackbar('Error', 'Failed to logout');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to logout');
    } finally {
      isLoading.value = false;
    }
  }
}
