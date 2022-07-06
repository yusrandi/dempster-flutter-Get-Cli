import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli_dempster_flutter/app/cores/core_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_cli_dempster_flutter/app/cores/core_strings.dart';
import 'package:get_cli_dempster_flutter/app/cores/core_styles.dart';
import 'package:get_cli_dempster_flutter/app/modules/diagnosa/views/diagnosa_view.dart';
import 'package:get_cli_dempster_flutter/app/modules/informasi/views/informasi_view.dart';
import 'package:get_cli_dempster_flutter/app/modules/konsultasi/views/konsultasi_view.dart';
import 'package:get_cli_dempster_flutter/app/modules/tentang/views/tentang_view.dart';
import 'package:lottie/lottie.dart';

import '../../../cores/core_images.dart';
import '../../auth/controllers/authentication_manager.dart';
import '../../auth/views/auth_view.dart';
import '../../result/controllers/result_manager.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final AuthenticationManager _authManager = Get.put(AuthenticationManager());
  final ResultManager resultManager = Get.put(ResultManager());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return _authManager.isLogged.value ? body(context) : AuthView();
    }));
  }

  Container body(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(gradient: CoreColor.bottomShadowShoft),
      child: Stack(
        children: [
          Obx((() => Container(
              child: controller.count.value == 0
                  ? _dashBoardView()
                  : controller.count.value == 1
                      ? InformasiView()
                      : controller.count.value == 2
                          ? DiagnosaView()
                          : controller.count.value == 3
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
              child: _listMenu("assets/icons/Conversation.svg", 2, "diagnosa")),
          Expanded(
              flex: 1,
              child: _listMenu("assets/icons/Bill Icon.svg", 3, "history")),
          Expanded(
              flex: 1,
              child: _listMenu("assets/icons/Settings.svg", 4, "setting")),
        ],
      ),
    );
  }

  Container _dashBoardView() {
    return Container(
        margin: EdgeInsets.all(8),
        child: Stack(
          children: [
            Positioned(
              top: 46,
              left: 16,
              right: 16,
              child: Row(children: [
                SvgPicture.asset("assets/icons/Bell.svg",
                    color: CoreColor.primary),
                SizedBox(width: 16),
                Text("${CoreStrings.appName}", style: CoreStyles.uTitle),
              ]),
            ),
            Center(child: Lottie.asset(CoreImages.ionJson)),
            Positioned(
              left: 16,
              right: 16,
              bottom: 86,
              child: Column(
                children: [
                  Text(
                      resultManager.getValue() == null
                          ? 'anda belum konsultasi'
                          : (resultManager.getValue()! * 100)
                                  .round()
                                  .toString() +
                              ' %',
                      style: CoreStyles.uTitle),
                  Text(
                      resultManager.getID() == null
                          ? '...'
                          : 'Hasil diagnosa terakhir dengan penyakit ${resultManager.getID()}',
                      style: CoreStyles.uSubTitle,
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _listMenu(String title, int index, String menu) {
    return Obx((() => GestureDetector(
          onTap: () {
            controller.setIndex(index);
          },
          child: Container(
            height: 60,
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
                      fontSize: 12,
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
