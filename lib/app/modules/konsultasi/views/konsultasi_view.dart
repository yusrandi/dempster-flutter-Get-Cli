import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli_dempster_flutter/app/routes/app_pages.dart';
import 'package:intl/intl.dart';

import '../../../cores/core_colors.dart';
import '../../../cores/core_styles.dart';
import '../controllers/konsultasi_controller.dart';

class KonsultasiView extends GetView<KonsultasiController> {
  String dateNow = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Text("History Diagnosa", style: CoreStyles.uTitle),
                MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.only(bottom: 8, top: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    child: Icon(Icons.circle,
                                        color: CoreColor.primary),
                                  ),
                                  Container(
                                    width: 3,
                                    height: 100,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              Expanded(
                                  child: Container(
                                // height: getProportionateScreenHeight(130),
                                margin: EdgeInsets.only(left: 5),
                                padding: EdgeInsets.only(left: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama Penyakit',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 16),
                                    Text("14 April 2023",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        "Harap Melakukan Konsultasi Lebih Lanjut Kepada Dokter Ahli",
                                        style: TextStyle(
                                            color: CoreColor.primary,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                      margin: EdgeInsets.only(top: 8),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 26, vertical: 8),
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Text("97%",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        );
                      }),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
        Positioned(
          right: 8,
          bottom: 80,
          child: FloatingActionButton(
            onPressed: () {
              Get.toNamed(Routes.DIAGNOSA);
            },
            backgroundColor: CoreColor.primary,
            child: Icon(Icons.add),
          ),
        )
      ],
    );
  }
}
