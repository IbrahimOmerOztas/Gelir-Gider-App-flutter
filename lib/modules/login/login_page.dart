import 'package:flutter/material.dart';
import 'package:gelir_gider_app/modules/login/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController controller = Get.find<LoginController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await controller.googleIleGirisYap();
          },
          child: Text("Google İle Giriş Yap"),
        ),
      ),
    );
  }
}
