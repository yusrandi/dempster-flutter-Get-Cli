import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli_dempster_flutter/app/cores/core_colors.dart';
import 'package:get_cli_dempster_flutter/app/cores/core_images.dart';
import 'package:get_cli_dempster_flutter/app/routes/app_pages.dart';
import 'package:lottie/lottie.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(36),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: CoreColor.bottomShadow),
        child: Center(
            child: Column(
          children: [
            Expanded(flex: 5, child: Lottie.asset(CoreImages.doctorJson)),
            SizedBox(height: 16),
            Expanded(
              flex: 1,
              child: Column(children: [
                Text(
                  "Metode Dempster Shafer",
                  style: TextStyle(
                      color: CoreColor.primary,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                Text("Sistem Pakar Pendiagnosa Penyakit Infeksi Pada Anak",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: CoreColor.primarySoft,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ]),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: (() => Get.offAllNamed(Routes.HOME)),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: CoreColor.primary),
                child: Center(
                    child: Text(
                  'GET STARTED',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
                
              ),
            )
          ],
        )),
      ),
    );
  }
}
