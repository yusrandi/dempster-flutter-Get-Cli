import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli_dempster_flutter/app/modules/diagnosa/controllers/diagnosa_controller.dart';

import '../../../cores/core_colors.dart';
import '../controllers/result_controller.dart';

class ResultView extends GetView<ResultController> {
  final ResultController resultController = Get.put(ResultController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoreColor.primary.withOpacity(0.2),
      appBar: AppBar(
        title: Text("Result Diagnosa"),
        centerTitle: false,
        backgroundColor: CoreColor.primary,
      ),
      body: Center(
          child: Obx(
        () => Text(
          'ResultView is working ${resultController.count}',
          style: TextStyle(fontSize: 20),
        ),
      )),
    );
  }
}
