import 'dart:math';

import 'package:get/get.dart';
import 'package:get_cli_dempster_flutter/app/data/models/laporan_model.dart';
import 'package:get_cli_dempster_flutter/app/data/models/penyakit_model.dart';
import 'package:get_cli_dempster_flutter/app/data/services/penyakit_service.dart';

import '../../../cores/core_colors.dart';
import '../../../cores/core_strings.dart';
import '../../../data/services/laporan_service.dart';
import '../../../routes/app_pages.dart';
import '../../auth/controllers/authentication_manager.dart';
import '../../diagnosa/controllers/diagnosa_controller.dart';

class ResultController extends GetxController {
  final count = 0.obs;
  final indexResult = 0.obs;
  List<ResultModel> listAllResult = <ResultModel>[].obs;
  List<PenyakitModel> listPenyakit = <PenyakitModel>[].obs;
  List<ResultItem> listResultItem = <ResultItem>[].obs;

  RxString id = ''.obs;
  RxDouble value = 0.0.obs;

  final AuthenticationManager authenticationManager = Get.find();

  @override
  void onInit() async {
    super.onInit();

    listPenyakit = await PenyakitService().fetchPenyakit();
    print('Penyakits ${listPenyakit.length}');
    final List<DiagnosaModel> diagnosaModels = Get.arguments;

    setResult(diagnosaModels);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void setResult(List<DiagnosaModel> diagnosaModel) {
    var listResult = [];
    count.value =
        diagnosaModel.where((element) => element.isSelected == true).length;
    diagnosaModel
        .where((element) => element.isSelected == true)
        .forEach((element) {
      var penyakits = element.gejalaModel.basisPengetahuans!
          .map((e) => e.penyakit!.penyakitKode)
          .join(",");

      print(
          "ResultController ${element.gejalaModel.gejalaKode}, bobot ${element.gejalaModel.bobot}, penyakit ${penyakits}");
      listResult.add({
        penyakits: double.parse(element.gejalaModel.bobot!),
        'X': 1 - double.parse(element.gejalaModel.bobot!)
      });
    });

    print(listResult.toString());

    var mResult = {};

    for (var i = 0; i < listResult.length; i++) {
      if (i > 0) {
        print(listResult[i]);

        mResult = nilaiMatrixMap(mResult, listResult[i]);
        print('result $mResult');
        print('=====================================');
      } else {
        mResult = listResult[0];
      }
    }
  }

  nilaiMatrixMap(Map a, Map b) {
    print("a = $a");
    print("b = $b");
    var mResult = {};

    a.forEach((keyA, valueA) {
      b.forEach((keyB, valueB) {
        // print(
        //     "KeyA $keyA($valueA) * KeyB $keyB($valueB) = ${roundDouble(valueA * valueB, 2)} ");

        var listA = keyA.split(',');
        var listB = keyB.split(',');
        if (keyA == 'X' || keyB == 'X') {
          if (keyA != 'X' || keyB != 'X') {
            listA.removeWhere((item) => item == 'X');
            listB.removeWhere((item) => item == 'X');
          }
          var key = listA.toSet().union(listB.toSet()).join(',');
          if (key == '') {
            key = 'Z';
          }

          // mResult.putIfAbsent(key, () => roundDouble(valueA * valueB, 2));

          if (mResult.containsKey(key)) {
            double valueOld = mResult[key];
            print('has value $valueOld');

            mResult.update(
                key, (value) => roundDouble((valueOld + (valueA * valueB)), 2));
          } else {
            mResult.putIfAbsent(key, () => roundDouble(valueA * valueB, 2));
          }
          print("Hasil union $key = ${roundDouble(valueA * valueB, 2)}");
        } else {
          var key = listA.toSet().intersection(listB.toSet()).join(',');

          if (key == '') {
            key = 'Z';
          }
          // mResult.putIfAbsent(key, () => roundDouble(valueA * valueB, 2));

          if (mResult.containsKey(key)) {
            double valueOld = mResult[key];
            print('has value $valueOld');

            mResult.update(
                key, (value) => roundDouble((valueOld + (valueA * valueB)), 2));
          } else {
            mResult.putIfAbsent(key, () => roundDouble(valueA * valueB, 2));
          }
          print(
              "Hasil intersection ${key} = ${roundDouble(valueA * valueB, 2)}");
        }
      });
    });

    double pembagiValue = 0.0;

    mResult.forEach((key, value) {
      if (key == 'Z') {
        pembagiValue = value;
        print('nilai pembagi $pembagiValue');
      }
    });

    var mResultLast = {};

    mResult.forEach((key, value) {
      if (key != 'Z') {
        print(
            'Key $key value $value, pembagi $pembagiValue, hasilbagi ${roundDouble(value / (1 - pembagiValue), 2)}');
        mResultLast.putIfAbsent(
            key, () => roundDouble(value / (1 - pembagiValue), 2));
      }
    });

    List<ResultItem> result = [];
    mResultLast.forEach((key, value) {
      result.add(ResultItem(key, value));
    });

    listAllResult.add(ResultModel(a.toString(), b.toString(), result));

    listResultItem.clear();
    result.forEach((element) {
      var namas = [];
      if (element.id != 'X') {
        element.id.split(',').forEach((el) {
          print('Nama ${getPenyakit(el)}');
          namas.add(getPenyakit(el));
        });
        listResultItem.add(ResultItem(namas.join(','), element.value));
      }
    });

    ResultItem resultItem =
        listResultItem.reduce(((a, b) => a.value > b.value ? a : b));

    print('ResultItem $resultItem');
    id.value = resultItem.id;
    value.value = resultItem.value;

    if (id.value == 'Difteri') {
      indexResult.value = 0;
    } else if (id.value == 'Gondongan') {
      indexResult.value = 1;
    }

    indexResult.value = id.value == 'Difteri'
        ? 0
        : id.value == 'Gondongan'
            ? 1
            : id.value == 'Campak Morbili'
                ? 2
                : id.value == 'Tetanus'
                    ? 3
                    : id.value == 'TBC'
                        ? 4
                        : id.value == 'Polio'
                            ? 5
                            : id.value == 'Hepatitis B'
                                ? 6
                                : id.value == 'Hepatitis A'
                                    ? 7
                                    : id.value == 'Tifoid'
                                        ? 8
                                        : id.value == 'Demam Berdarah'
                                            ? 9
                                            : id.value == 'Malaria'
                                                ? 10
                                                : id.value == 'Congekan'
                                                    ? 11
                                                    : 0;

    return mResultLast;
  }

  double roundDouble(double value, int places) {
    num mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  String getPenyakit(String kodePenyakit) {
    PenyakitModel penyakit = listPenyakit
        .where((element) => element.penyakitKode == kodePenyakit)
        .first;
    return penyakit.penyakitNama!;
  }

  Future<String> storeResult(String penyakits, String cf) async {
    String result = await LaporanService().create(LaporanModel(
        userId: int.parse(authenticationManager.getToken()!),
        penyakits: penyakits,
        cf: cf));

    Get.offAndToNamed(Routes.HOME);

    Get.snackbar(CoreStrings.appName, result,
        backgroundColor: CoreColor.whiteSoft, duration: Duration(seconds: 2));

    return result;
  }
}

class ResultModel {
  String a;
  String b;
  List<ResultItem> result;

  ResultModel(this.a, this.b, this.result);
}

class ResultItem {
  String id;
  double value;

  ResultItem(this.id, this.value);
}
