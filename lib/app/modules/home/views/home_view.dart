import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli_dempster_flutter/app/cores/core_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_cli_dempster_flutter/app/modules/informasi/views/informasi_view.dart';
import 'package:get_cli_dempster_flutter/app/modules/konsultasi/views/konsultasi_view.dart';
import 'package:get_cli_dempster_flutter/app/modules/tentang/views/tentang_view.dart';
import 'package:lottie/lottie.dart';

import '../../../cores/core_images.dart';
import '../../auth/controllers/authentication_manager.dart';
import '../../auth/views/auth_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final AuthenticationManager _authManager = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return _authManager.isLogged.value ? body() : AuthView();
    }));
  }

  Container body() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(gradient: CoreColor.bottomShadowShoft),
      child: Stack(
        children: [
          Obx((() => Container(
              child: controller.count.value == 0
                  ? _dashBoardView()
                  : controller.count.value == 1
                      ? InformasiView()
                      : controller.count.value == 2
                          ? KonsultasiView()
                          : TentangView()))),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 80,
              child: _tabItem(),
            ),
          ),
        ],
      ),
    );
  }

  _tabItem() {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 1,
              child: _listMenu("assets/icons/home-filled.svg", 0, "home")),
          Expanded(
              flex: 1,
              child: _listMenu(
                  "assets/icons/bookmark-filled.svg", 1, "informasi")),
          Expanded(
              flex: 1,
              child: _listMenu("assets/icons/Bill Icon.svg", 2, "diagnosa")),
          Expanded(
              flex: 1,
              child: _listMenu("assets/icons/Settings.svg", 3, "setting")),
        ],
      ),
    );
  }

  Container _dashBoardView() {
    return Container(
        child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/Bell.svg",
                    color: CoreColor.primary),
                SizedBox(width: 16),
                Text("Userundie de Lahoya",
                    style: TextStyle(
                        color: CoreColor.primary,
                        fontSize: 36,
                        fontWeight: FontWeight.bold)),
              ]),
          Text("14 April 2022",
              style: TextStyle(color: CoreColor.primary, fontSize: 16)),
          Lottie.asset(CoreImages.ionJson),
          SizedBox(height: 16),
          Text("28%",
              style: TextStyle(
                  color: CoreColor.primary,
                  fontSize: 66,
                  fontWeight: FontWeight.bold)),
          Text(
              "Diagnosa Terakhir Pada tanggal 14 April 2022 dengan penyakit Malarindu",
              style: TextStyle(color: CoreColor.primary, fontSize: 16),
              textAlign: TextAlign.center),
        ],
      ),
    ));
  }

  Widget _listMenu(String title, int index, String menu) {
    return Obx((() => GestureDetector(
          onTap: () {
            controller.setIndex(index);
          },
          child: Container(
            height: 80,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    title,
                    color: controller.count.value == index
                        ? CoreColor.primary
                        : CoreColor.kHintTextColor,
                    height: 20,
                  ),
                  Text(
                    menu,
                    style: TextStyle(
                      color: controller.count.value == index
                          ? CoreColor.primary
                          : CoreColor.kHintTextColor,
                    ),
                  )
                ],
              ),
            ),
          ),
        )));
  }
}
