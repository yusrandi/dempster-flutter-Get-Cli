import 'package:get/get.dart';
import 'package:get_cli_dempster_flutter/app/data/models/gejala_model.dart';
import 'package:get_cli_dempster_flutter/app/data/services/gejala_service.dart';

class DiagnosaController extends GetxController {
  final count = 0.obs;
  final ischeck = false.obs;
  List<int> listResult = <int>[].obs;
  RxList<DiagnosaModel> dataListResult = (List<DiagnosaModel>.of([])).obs;
  RxList<DiagnosaModel> myList = <DiagnosaModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    List<GejalaModel> gejala = await getGejala();
    gejala.forEach((element) {
      dataListResult.add(DiagnosaModel(element, false));
      myList.add(DiagnosaModel(element, false));
    });

    myList.refresh();
    dataListResult.refresh();
    print("DiagnosaController ${dataListResult.length}");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Future<List<GejalaModel>> getGejala() async {
    return await GejalaService().fetchGejala();
  }

  itemChange(bool val, int index) {
    dataListResult[index].isSelected = val;
    dataListResult.refresh();
  }
}

class DiagnosaModel {
  GejalaModel gejalaModel;
  bool isSelected = false;

  DiagnosaModel(this.gejalaModel, this.isSelected);
}
