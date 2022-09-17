import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli_dempster_flutter/app/data/models/gejala_model.dart';
import 'package:get_cli_dempster_flutter/app/routes/app_pages.dart';

import '../../../cores/core_colors.dart';
import '../../../cores/core_strings.dart';
import '../../../cores/core_styles.dart';
import '../controllers/diagnosa_controller.dart';

class DiagnosaView extends GetView<DiagnosaController> {
  final DiagnosaController diagnosaController = Get.put(DiagnosaController());

  List<CheckBoxListTileModel> checkBoxListTileModel = getUsers();

  static List<CheckBoxListTileModel> getUsers() {
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(userId: 1, title: "Android", isCheck: true),
      CheckBoxListTileModel(userId: 2, title: "Flutter", isCheck: false),
      CheckBoxListTileModel(userId: 3, title: "IOS", isCheck: false),
      CheckBoxListTileModel(userId: 4, title: "PHP", isCheck: false),
      CheckBoxListTileModel(userId: 5, title: "Node", isCheck: false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: CoreColor.primary.withOpacity(0.2),

      body: Stack(children: [
        body(context),
        Obx(
          () => Visibility(
            visible: diagnosaController.dataListResult
                        .where((p0) => p0.isSelected == true)
                        .length <
                    1
                ? false
                : true,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: (() {
                  Get.toNamed(Routes.RESULT,
                          arguments: diagnosaController.dataListResult)!
                      .then((value) => Get.delete<DiagnosaController>());
                }),
                child: Container(
                  height: 50,
                  margin: EdgeInsets.only(bottom: 80, left: 16, right: 16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: CoreColor.primary),
                  child: Center(
                      child: Text(
                    'Submit',
                    style: CoreStyles.uSubTitle.copyWith(color: Colors.white),
                  )),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }

  Container body(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: CoreColor.bottomShadowShoft),
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Text("Form Diagnosa", style: CoreStyles.uTitle),
              SizedBox(height: 16),
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: listBody(),
              ),
              SizedBox(height: 160),
            ],
          ),
        ));
  }

  listBody() {
    return Obx(
      () => diagnosaController.dataListResult.isEmpty
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                DiagnosaModel g = diagnosaController.dataListResult[index];
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      color: diagnosaController.listResult.contains(index)
                          ? CoreColor.primary
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: CheckboxListTile(
                      activeColor: CoreColor.primary,
                      dense: true,
                      //font change
                      title: Text(
                        g.gejalaModel.gejalaNama!,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5),
                      ),
                      // subtitle: Text(
                      //   g.gejalaModel.gejalaKode!,
                      //   style: TextStyle(
                      //       fontSize: 10,
                      //       color: CoreColor.kTextColor,
                      //       fontWeight: FontWeight.w600,
                      //       letterSpacing: 0.5),
                      // ),
                      value: g.isSelected,
                      onChanged: (bool? val) {
                        print("diagnosaView $val");
                        diagnosaController.itemChange(val!, index);
                      }),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 8),
              itemCount: diagnosaController.dataListResult.length),
    );
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

  body2() {
    return ListView.builder(
        itemCount: checkBoxListTileModel.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  CheckboxListTile(
                      activeColor: Colors.pink[300],
                      dense: true,
                      //font change
                      title: Text(
                        checkBoxListTileModel[index].title,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5),
                      ),
                      value: checkBoxListTileModel[index].isCheck,
                      onChanged: (bool? val) {})
                ],
              ),
            ),
          );
        });
  }

  void itemChange(bool val, int index) {}
}

class CheckBoxListTileModel {
  int userId;
  String title;
  bool isCheck;

  CheckBoxListTileModel(
      {required this.userId, required this.title, required this.isCheck});
}
