import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli_dempster_flutter/app/cores/core_styles.dart';
import 'package:get_cli_dempster_flutter/app/modules/diagnosa/controllers/diagnosa_controller.dart';

import '../../../cores/core_colors.dart';
import '../../../routes/app_pages.dart';
import '../controllers/result_controller.dart';
import '../controllers/result_manager.dart';

class ResultView extends GetView<ResultController> {
  final ResultController resultController = Get.put(ResultController());
  final ResultManager resultManager = Get.put(ResultManager());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: CoreColor.primary.withOpacity(0.2),
        appBar: AppBar(
          title: Text("Hasil Diagnosa"),
          centerTitle: false,
          backgroundColor: CoreColor.primary,
        ),
        body: Container(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Gejala yang dirasakan user', style: CoreStyles.uSubTitle),
                listDiagnosa(),
                Text('Hasil Diagnosa Penyakit', style: CoreStyles.uSubTitle),
                listLastResult(),
                Obx(() => Column(
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'Dari hasil diagnosa anda menderita',
                              style: CoreStyles.uContent,
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' ${resultController.id.value} ',
                                  style: CoreStyles.uSubTitle,
                                ),
                                TextSpan(
                                  text: ' Sebesar ',
                                  style: CoreStyles.uContent,
                                ),
                                TextSpan(
                                  text: resultController.value.value * 100 > 100
                                      ? '100%'
                                      : '${resultController.value.value * 100}%',
                                  style: CoreStyles.uTitle,
                                ),
                                TextSpan(
                                  text: resultController.value.value * 100 > 90
                                      ? '\nHarap segera periksa ke Dokter'
                                      : '',
                                  style: CoreStyles.uContent,
                                ),
                              ]),
                        ),
                        SizedBox(height: 16),
                        RichText(
                          text: TextSpan(
                              text:
                                  'Informasi terkait Gejala, Ciri-ciri, dan penanganannya ?',
                              style: CoreStyles.uContent,
                              children: <TextSpan>[
                                TextSpan(
                                    text: '\nKlik disini!',
                                    style: CoreStyles.uSubTitle,
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // navigate to desired screen
                                        // resultManager.saveResult(
                                        //     id: resultController.id.value,
                                        //     value:
                                        //         resultController.value.value);
                                        Get.toNamed(Routes.DETAIL,
                                            arguments: resultController
                                                .indexResult.value);
                                      })
                              ]),
                        ),
                        Container(
                            height: 150,
                            width: 150,
                            margin: EdgeInsets.all(16),
                            child: Stack(
                              children: [
                                Container(
                                  height: 150,
                                  width: 150,
                                  child: CircularProgressIndicator(
                                    backgroundColor: CoreColor.kHintTextColor,
                                    strokeWidth: 10,
                                    value: resultController.value.value,
                                    valueColor:
                                        new AlwaysStoppedAnimation<Color>(
                                            CoreColor.primary),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    (resultController.value.value * 100)
                                            .round()
                                            .toString() +
                                        " %",
                                    style: TextStyle(
                                        color: CoreColor.primary, fontSize: 24),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    )),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: (() {
                    resultManager.saveResult(
                        id: resultController.id.value,
                        value: resultController.value.value);

                    resultController.storeResult(resultController.id.value,
                        resultController.value.value.toString());
                  }),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: CoreColor.primary),
                    child: Center(
                        child: Text(
                      'SELESAI',
                      style: CoreStyles.uSubTitle.copyWith(color: Colors.white),
                    )),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Container listRumus() {
    return Container(
        padding: EdgeInsets.all(16),
        child: Obx(() => ListView.separated(
            itemBuilder: ((context, index) {
              ResultModel m = resultController.listAllResult[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'M ${index + 1}',
                    style: CoreStyles.uSubTitle,
                  ),
                  Text('X = ${m.a}'),
                  Text('Y = ${m.b}'),
                  Text('Hasil = ${resultController.listAllResult.last.result}'),
                  MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 8,
                            ),
                        itemCount: m.result.length,
                        itemBuilder: (context, index) {
                          ResultItem item = m.result[index];
                          return Text('ID ${item.id}, KEY ${item.value}');
                        }),
                  ),
                ],
              );
            }),
            separatorBuilder: (context, index) => SizedBox(height: 8),
            itemCount: resultController.listAllResult.length)));
  }

  Container listLastResult() {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Obx(() => Column(
              children: [
                ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) {
                      ResultItem item = resultController.listResultItem[index];

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text(item.id.toString())),
                          Container(
                              width: 50,
                              child: Text('${(item.value * 100)} %')),
                        ],
                      );
                    }),
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: resultController.listResultItem.length),
              ],
            )));
  }

  Container listDiagnosa() {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Obx(() => Column(
              children: [
                ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) {
                      String item = resultController.listDiagnosa[index];

                      return Text(item);
                    }),
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: resultController.listDiagnosa.length),
              ],
            )));
  }
}
