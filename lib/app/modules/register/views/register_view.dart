import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli/app/routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => controller.name.value = value,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              onChanged: (value) => controller.email.value = value,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              onChanged: (value) => controller.password.value = value,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            Obx(() => controller.isLoading.value
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () => controller.register(),
                    child: const Text('Register'),
                  )),
            TextButton(
              onPressed: () => Get.toNamed(Routes.LOGIN),
              child: const Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}
