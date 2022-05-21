import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli_dempster_flutter/app/cores/core_colors.dart';
import 'package:get_cli_dempster_flutter/app/modules/home/views/home_view.dart';
import 'package:indent/indent.dart';

import '../../../cores/core_styles.dart';
import '../../../routes/app_pages.dart';
import '../controllers/informasi_controller.dart';

class InformasiView extends GetView<InformasiController> {
  final informasiController = Get.put(InformasiController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Text("Infromasi Penyakit Infeksi Pada Anak",
              style: TextStyle(
                  color: CoreColor.primary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
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
                itemCount: informasiController.listTitle.length,
                itemBuilder: (context, index) => menuItem(index)),
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }

  menuItem(int index) {
    return GestureDetector(
      onTap: (() => Get.toNamed(Routes.DETAIL, arguments: index)),
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(Icons.file_copy, color: CoreColor.kTextColor),
            ),
            Expanded(
                child: Container(
              child: Text(informasiController.listTitle[index]['title'],
                  style: CoreStyles.uSubTitle),
            )),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(Icons.chevron_right, color: CoreColor.primary),
            ),
          ],
        ),
      ),
    );
  }
}
