import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/routes/app_pages.dart';
import 'package:portfolio/theme/app_theme.dart';

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Santhosh Kumar — Portfolio',
      theme: AppTheme.darkTheme,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
