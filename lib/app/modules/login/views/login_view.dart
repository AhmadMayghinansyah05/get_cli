import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli/app/routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
                    onPressed: () => controller.login(),
                    child: const Text('Login'),
                  )),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => Get.toNamed(Routes.REGISTER),
              child: const Text("Don't have an account? Register here"),
            ),
          ],
        ),
      ),
    );
  }
}
