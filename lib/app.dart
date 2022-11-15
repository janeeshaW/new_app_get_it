import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/util/app_colors.dart';
import 'package:news_app/core/util/navigation_routes.dart';

import 'flavors.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);


  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(288, 624),
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp(
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.SPLASH_VIEW,
          title: F.title,
          onGenerateRoute: Routes.generateRoute,
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primaryColor: AppColors.colorPrimary,
            scaffoldBackgroundColor: Colors.white,
          ),
        );
      },
    );
  }
}
