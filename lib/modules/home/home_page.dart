import 'package:flutter/material.dart';
import 'package:gelir_gider_app/modules/home/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
              child: Obx(() {
                // Eğer kategori boşsa bilgi gösterebilirsin
                if (controller.categories.isEmpty) {
                  return const Center(child: Text("No categories found"));
                }

                return ListView.builder(
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    final category = controller.categories[index];
                    return ListTile(
                      title: Text(category.name ?? 'Unnamed Category'),
                      // İstersen icon veya başka detaylar ekleyebilirsin
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
