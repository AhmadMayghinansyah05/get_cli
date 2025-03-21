import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:get_cli/app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  final box = GetStorage();

  Future<void> register() async {
    isLoading.value = true;
    try {
      var response = await Dio().post(
        'https://recipe.incube.id/api/register',
        data: {
          'name': name.value,
          'email': email.value,
          'password': password.value,
        },
      );

      if (response.statusCode == 201) {
        box.write('1225|FT1CQFxOURmRzcy7Ykp29RTMYRS6oaS0x4UKD0bPdd8c1d99', response.data['data']['1225|FT1CQFxOURmRzcy7Ykp29RTMYRS6oaS0x4UKD0bPdd8c1d99']);
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar('Error', response.data['message']);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to register');
    } finally {
      isLoading.value = false;
    }
  }
}
