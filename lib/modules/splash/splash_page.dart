import 'package:flutter/material.dart';
import 'package:gelir_gider_app/modules/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});
  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
