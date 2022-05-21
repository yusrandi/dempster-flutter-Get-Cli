import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli_dempster_flutter/app/data/models/gejala_model.dart';

import '../../../cores/core_colors.dart';
import '../../../cores/core_styles.dart';
import '../controllers/diagnosa_controller.dart';

class DiagnosaView extends GetView<DiagnosaController> {
  final DiagnosaController diagnosaController = Get.put(DiagnosaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoreColor.primary.withOpacity(0.2),
      appBar: AppBar(
        title: Text("Form Diagnosa"),
        centerTitle: false,
        backgroundColor: CoreColor.primary,
      ),
      body: Container(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Form Diagnosa",
                  style: CoreStyles.uSubTitle,
                ),
                SizedBox(height: 16),
                FutureBuilder<List<GejalaModel>>(
                  future: diagnosaController.getGejala(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    print(snapshot.data);
                    if (snapshot.data!.isEmpty) {
                      return Container(
                        child: Center(
                          child: Text('DIagnosa Belum Tersedia'),
                        ),
                      );
                    }
                    return listBody(snapshot.data!);
                  },
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: (() {}),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: CoreColor.primary),
                    child: Center(
                        child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                  ),
                )
              ],
            ),
          )),
    );
  }

  ListView listBody(List<GejalaModel> list) {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return menuItem(list[index], index);
        },
        separatorBuilder: (context, index) => SizedBox(height: 8),
        itemCount: list.length);
  }

  menuItem(GejalaModel g, index) {
    return GestureDetector(onTap: (() {
      diagnosaController.listResult.contains(index)
          ? diagnosaController.listResult.remove(index)
          : diagnosaController.listResult.add(index);
    }), child: Obx(
      () {
        return Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              color: diagnosaController.listResult.contains(index)
                  ? CoreColor.primary
                  : Colors.white,
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Icon(Icons.file_copy,
                    color: diagnosaController.listResult.contains(index)
                        ? Colors.white
                        : CoreColor.primary),
              ),
              Expanded(
                  child: Container(
                child: Text(g.gejalaNama!,
                    style: CoreStyles.uSubTitle.copyWith(
                        fontSize: 14,
                        color: diagnosaController.listResult.contains(index)
                            ? Colors.white
                            : CoreColor.kTextColor)),
              )),
            ],
          ),
        );
      },
    ));
  }
}
