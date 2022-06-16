import 'dart:math';

import 'package:get/get.dart';

import '../../diagnosa/controllers/diagnosa_controller.dart';

class ResultController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

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

          if (mResult.containsKey(key)) {
            double valueOld = mResult[key];
            print('has value $valueOld');

            mResult.update(
                key, (value) => roundDouble((valueOld + (valueA * valueB)), 2));
          } else {
            mResult.putIfAbsent(key, () => roundDouble(valueA * valueB, 2));
          }

          print("Hasil $key = ${roundDouble(valueA * valueB, 2)}");
        } else {
          var key = listA.toSet().intersection(listB.toSet()).join(',');

          if (mResult.containsKey(key)) {
            double valueOld = mResult[key];
            print('has value $valueOld');

            mResult.update(
                key, (value) => roundDouble((valueOld + (valueA * valueB)), 2));
          } else {
            mResult.putIfAbsent(key, () => roundDouble(valueA * valueB, 2));
          }
          print("Hasil ${key} = ${roundDouble(valueA * valueB, 2)}");
        }
      });
    });

    return mResult;
  }

  double roundDouble(double value, int places) {
    num mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }
}
