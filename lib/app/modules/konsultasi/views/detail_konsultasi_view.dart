import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../cores/core_colors.dart';
import '../../../cores/core_styles.dart';

class DetailKonsultasiView extends StatelessWidget {
  const DetailKonsultasiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String gejalas = Get.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: CoreColor.primary,
        centerTitle: false,
        title: Text('Detail'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text('Gejala yang dirasakan user',
                  style: CoreStyles.uTitle.copyWith(fontSize: 20)),
              listDiagnosa(gejalas.split(",")),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Container listDiagnosa(List<String> list) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: ((context, index) {
                  String item = list[index];

                  return Text(
                    item,
                    style: CoreStyles.uContent,
                  );
                }),
                separatorBuilder: (context, index) => Divider(),
                itemCount: list.length),
          ],
        ));
  }
}
