import 'package:flutter/material.dart';
import 'package:gelir_gider_app/core/app_bindings.dart';
import 'package:gelir_gider_app/routes/app_pages.dart';
import 'package:gelir_gider_app/themes/app_theme.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.INITIAL,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      initialBinding: AppBindings(),
    );
  }
}
