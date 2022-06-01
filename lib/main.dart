import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:klik_daily/app/routes/app_pages.dart';

import 'app/ui/theme/app_theme.dart';
import 'get_storage_service.dart';

void main() async {
  await GetStorage.init();
  Get.put(GeneralGetStorageService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: const CustomScrollBehaviour(),
      title: "Application",
      enableLog: kDebugMode,
      theme: appThemeData,
      defaultTransition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
      color: Colors.white,
    );
  }
}

class CustomScrollBehaviour extends ScrollBehavior {
  const CustomScrollBehaviour();
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
