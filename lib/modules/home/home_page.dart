import 'package:flutter/material.dart';
import 'package:gelir_gider_app/modules/home/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () async {
              await controller.googleCikisYap();
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading) {
          // Yükleniyorsa sadece loading spinner göster
          return const Center(child: CircularProgressIndicator());
        }
        final user = controller.user.value;
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (user.profilePhoto != null) Image.network(user.profilePhoto!),
              SizedBox(height: 10),
              Text(user.email ?? ''),
              SizedBox(height: 10),
              Text(user.firstName ?? ''),
              SizedBox(height: 10),
              Text(user.lastName ?? ''),
              SizedBox(height: 10),
            ],
          ),
        );
      }),
    );
  }
}

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text("HomePage"),
          ElevatedButton(
            onPressed: () async {
              await controller.googleCikisYap();
            },
            child: const Text("Sign Out"),
          ),
          const SizedBox(height: 20),

          // Expanded ile sarmala
          Expanded(
            child: controller.categories.isEmpty
                ? const Center(child: Text("No categories found"))
                : ListView.builder(
                    itemCount: controller.categories.length,
                    itemBuilder: (context, index) {
                      final category = controller.categories[index];
                      return ListTile(
                        title: Text(category.name ?? 'Unnamed Category'),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
