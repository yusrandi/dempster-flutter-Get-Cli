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
          listItem('Home',
              'Menu home merupakan menu halaman utama dari aplikasi child care dan juga terdapat hasil dari diagnosa terakhir yang telah dilakukan oleh pasien.'),
          listItem('Informasi',
              'Menu informasi merupakan menu yang berisi tentang jenis-jenis penyakit infeksi pada anak yang lengkap dengan penjelasannya.'),
          listItem('Diagnosa',
              'Menu diagnosa merupakan menu yang dapat digunakan pasien untuk mengetahui jenis penyakit yang diderita oleh si anak dengan cara memilih beberapa evidence (gejala/ciri-ciri) yang dialami anak.'),
          listItem('History',
              'Menu history merupakan menu yang dapat digunakan untuk melihat hasil dari setiap diagnosa yang dilakukan.'),
          listItem('About',
              'Menu about merupakan menu yang ditujukan untuk memberikan penjelasan dari setiap menu yang terdapat dalam aplikasi child care.'),
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
