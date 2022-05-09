import 'package:flutter/material.dart';

import '../../../cores/core_colors.dart';

class DetailInformasi extends StatelessWidget {
  const DetailInformasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: CoreColor.bottomShadowShoft),
      child: Center(
        child: Text("Detail Informasi"),
      ),
    );
  }
}
