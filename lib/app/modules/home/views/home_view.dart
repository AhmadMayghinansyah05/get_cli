import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          Obx(() => controller.isLoading.value
              ? const Padding(
                  padding: EdgeInsets.all(10),
                  child: CircularProgressIndicator(),
                )
              : IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () => controller.logout(),
                )),
        ],
      ),
      body: const Center(child: Text('Welcome to the Home Page!')),
    );
  }
}
