import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli_dempster_flutter/app/cores/core_colors.dart';
import 'package:get_cli_dempster_flutter/app/cores/core_images.dart';
import 'package:get_cli_dempster_flutter/app/cores/core_styles.dart';
import 'package:get_cli_dempster_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:get_cli_dempster_flutter/app/modules/home/views/home_view.dart';
import 'package:get_cli_dempster_flutter/app/routes/app_pages.dart';
import 'package:lottie/lottie.dart';

import '../../auth/controllers/authentication_manager.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  final AuthenticationManager _authmanager = Get.put(AuthenticationManager());
  final HomeController _homeController = Get.put(HomeController());
  Future<void> initializeSettings() async {
    _authmanager.checkLoginStatus();

    //Simulate other services for 3 seconds
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: initializeSettings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return body();
          } else {
            if (snapshot.hasError)
              return errorView(snapshot);
            else
              return HomeView();
          }
        },
      ),
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }

  Container body() {
    return Container(
      padding: EdgeInsets.all(36),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(gradient: CoreColor.bottomShadow),
      child: Center(
          child: Column(
        children: [
          Expanded(
              flex: 5, child: Lottie.asset(CoreImages.doctorJson, height: 100)),
          SizedBox(height: 16),
          Expanded(
            flex: 1,
            child: Text("Sistem Pakar Pendiagnosa Penyakit Infeksi Pada Anak",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: CoreColor.primarySoft,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 16),
        ],
      )),
    );
  }
}
