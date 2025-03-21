import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:get_cli/app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  final box = GetStorage();

  Future<void> login() async {
    isLoading.value = true;
    try {
      var response = await Dio().post(
        'https://recipe.incube.id/api/login',
        data: {
          'email': email.value,
          'password': password.value,
        },
      );

      if (response.statusCode == 200) {
        box.write('token', response.data['data']['token']);
        Get.offAllNamed(Routes.RECIPES);
      } else {
        Get.snackbar('Error', response.data['message']);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to login');
    } finally {
      isLoading.value = false;
    }
  }
}
