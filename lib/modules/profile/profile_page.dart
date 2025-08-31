import 'package:flutter/material.dart';
import 'package:gelir_gider_app/modules/profile/profile_controller.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(children: [Text(controller.user.value!.email.toString())]),
    );
  }
}
