import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli_dempster_flutter/app/cores/core_styles.dart';
import 'package:indent/indent.dart';

import '../../../cores/core_colors.dart';
import '../controllers/informasi_controller.dart';

class DetailInformasi extends StatelessWidget {
  final InformasiController informasiController = Get.find();

  @override
  Widget build(BuildContext context) {
    var index = Get.arguments;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: CoreColor.primary,
        centerTitle: false,
        title: Text(informasiController.listTitle[index]['title']),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pengertian',
                    style: CoreStyles.uTitle,
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white),
                    child: Text(
                      '${informasiController.listTitle[index]['subtitle']}'
                          .indent(10),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder<List<dynamic>>(
                future: informasiController.runFilter((index + 1).toString()),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(
                      color: CoreColor.primary,
                    );
                  }
                  print(snapshot.data);

                  return detailBody(snapshot.data!);
                }),
          ],
        ),
      ),
    );
  }

  detailBody(List<dynamic> data) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(
        height: 8,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(8.0),
        child: Visibility(
          visible: data[index]['desc'].length < 1 ? false : true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data[index]['detail'],
                style: CoreStyles.uTitle,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.all(8),
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 8,
                  ),
                  itemCount: data[index]['desc'].length,
                  itemBuilder: (context, i) => Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Visibility(
                            visible:
                                data[index]['desc'].length < 2 ? false : true,
                            child: Container(
                                margin: EdgeInsets.only(right: 8),
                                child: Text('${i + 1}. '))),
                        Expanded(
                            child: Text(
                          data[index]['desc'][i],
                          textAlign: TextAlign.justify,
                        )),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
