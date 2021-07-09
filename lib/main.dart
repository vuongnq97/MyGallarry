import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routers/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      locale: Get.deviceLocale,
      title: "My Gallarry",
      initialRoute: Routes.LOGIN,
      getPages: AppPages.pages,
      defaultTransition: Transition.fadeIn,
      navigatorObservers: <NavigatorObserver>[],
    );
  }
}
