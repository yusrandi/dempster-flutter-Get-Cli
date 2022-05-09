import 'package:get/get.dart';

import 'package:get_cli_dempster_flutter/app/modules/home/bindings/home_binding.dart';
import 'package:get_cli_dempster_flutter/app/modules/home/views/home_view.dart';
import 'package:get_cli_dempster_flutter/app/modules/informasi/bindings/informasi_binding.dart';
import 'package:get_cli_dempster_flutter/app/modules/informasi/views/informasi_view.dart';
import 'package:get_cli_dempster_flutter/app/modules/konsultasi/bindings/konsultasi_binding.dart';
import 'package:get_cli_dempster_flutter/app/modules/konsultasi/views/konsultasi_view.dart';
import 'package:get_cli_dempster_flutter/app/modules/splash/bindings/splash_binding.dart';
import 'package:get_cli_dempster_flutter/app/modules/splash/views/splash_view.dart';
import 'package:get_cli_dempster_flutter/app/modules/tentang/bindings/tentang_binding.dart';
import 'package:get_cli_dempster_flutter/app/modules/tentang/views/tentang_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.INFORMASI,
      page: () => InformasiView(),
      binding: InformasiBinding(),
    ),
    GetPage(
      name: _Paths.KONSULTASI,
      page: () => KonsultasiView(),
      binding: KonsultasiBinding(),
    ),
    GetPage(
      name: _Paths.TENTANG,
      page: () => TentangView(),
      binding: TentangBinding(),
    ),
  ];
}
