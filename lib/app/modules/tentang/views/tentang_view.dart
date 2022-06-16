import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../cores/core_styles.dart';
import '../controllers/tentang_controller.dart';

class TentangView extends GetView<TentangController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Text("Tentang", style: CoreStyles.uTitle),
          SizedBox(height: 16),
          listItem('Diagnosa',
              'Menu Diagnosa adalah menu yang dapat digunakan oleh user untuk mengetahui penyakit apa yang diderita pada anaknya dengan cara memilih beberapa gejala yang dialami.'),
          listItem('Jenis Penyakit',
              'Menu jenis penyakit adalah menu yang digunakan untuk melihat jenis penyakit yang biasa terjadi pada neonatus dan deskripsi dari penyakit tersebut.'),
          listItem('Tentang',
              'Menu Tentang adalah menu yang ditujukan untuk memberikan penjelasan kegunaan dari menu-menu yang disediakan oleh aplikasi kepada user.'),
        ],
      ),
    );
  }

  Container listItem(String title, String text) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text("$title", style: CoreStyles.uSubTitle),
          Text("$text", style: CoreStyles.uContent),
        ],
      ),
    );
  }
}
