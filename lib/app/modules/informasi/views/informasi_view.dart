import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli_dempster_flutter/app/cores/core_colors.dart';
import 'package:get_cli_dempster_flutter/app/modules/home/views/home_view.dart';

import '../../../routes/app_pages.dart';
import '../controllers/informasi_controller.dart';

class InformasiView extends GetView<InformasiController> {
  @override
  Widget build(BuildContext context) {
    final listItem = [
      Item('Difteri', HomeView()),
      Item('Gondongan', HomeView()),
      Item('Campak Mobil', HomeView()),
      Item('Tetanus', HomeView()),
      Item('TBC', HomeView()),
      Item('Polio', HomeView()),
      Item('Hepatitis A', HomeView()),
      Item('Hepatitis B', HomeView()),
    ];

    return Center(
        child: Container(
      margin: EdgeInsets.only(top: 36),
      child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Jenis Infeksi Pada Anak",
            style: TextStyle(
                color: CoreColor.primary,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
        SizedBox(height: 16),
        MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: listItem.length,
              itemBuilder: (context, index) {
                Item item = listItem[index];
                return GestureDetector(
                  onTap: (() => Get.toNamed(Routes.SPLASH)),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 8),
                    height: 80,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Icon(Icons.file_copy,
                              color: CoreColor.kTextColor),
                        ),
                        Expanded(
                            child: Container(
                          child:
                              Text(item.name, style: TextStyle(fontSize: 20)),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Icon(Icons.chevron_right,
                              color: CoreColor.primary),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ])),
    ));
  }
}

class Item {
  final String name;
  final Widget screen;
  Item(this.name, this.screen);
}
