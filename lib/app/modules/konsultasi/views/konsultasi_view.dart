import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli_dempster_flutter/app/routes/app_pages.dart';
import 'package:intl/intl.dart';

import '../../../cores/core_colors.dart';
import '../../../cores/core_styles.dart';
import '../../../data/models/laporan_model.dart';
import '../controllers/konsultasi_controller.dart';

class KonsultasiView extends GetView<KonsultasiController> {
  String dateNow = DateFormat('yyyy-MM-dd').format(DateTime.now());
  KonsultasiController konsultasiController = Get.put(KonsultasiController());

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
                  child: FutureBuilder<List<LaporanModel>>(
                    future: konsultasiController.getDataLaporan(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      List<LaporanModel> data = snapshot.data!;
                      return MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: data.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              LaporanModel model = data[index];
                              return itemLaporan(model);
                            }),
                      );
                    },
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container itemLaporan(LaporanModel model) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 8, top: 8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Icon(Icons.circle, color: CoreColor.primary),
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
                Text(model.tanggal!,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
                Text(
                    "Telah Melakukan Konsultasi Dengan Hasil ${model.penyakits}",
                    style: TextStyle(
                        color: CoreColor.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      padding:
                          EdgeInsets.symmetric(horizontal: 26, vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(16)),
                      child: Text('${(double.parse(model.cf!) * 100)} %',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(width: 8),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.DETAIL_KONSULTASI,
                          arguments: model.gejalas),
                      child: Container(
                        margin: EdgeInsets.only(top: 8),
                        padding:
                            EdgeInsets.symmetric(horizontal: 36, vertical: 8),
                        decoration: BoxDecoration(
                            color: CoreColor.primary,
                            borderRadius: BorderRadius.circular(16)),
                        child: Text('Detail',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
