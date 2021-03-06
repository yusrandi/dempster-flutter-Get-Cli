import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli_dempster_flutter/app/modules/auth/controllers/authentication_manager.dart';

import '../../../cores/core_colors.dart';
import '../../../cores/core_images.dart';
import '../../../cores/core_styles.dart';
import '../../../data/models/user_model.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);
  final ProfileController profileController = Get.put(ProfileController());
  final AuthenticationManager authenticationManager =
      Get.put(AuthenticationManager());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CoreColor.primary,
        centerTitle: false,
        title: Text('Profil'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: FutureBuilder<UserModel>(
            future: profileController.getUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              UserModel user = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Image.asset(CoreImages.logoImage, height: 200),
                  Text(user.name!, style: CoreStyles.uSubTitle),
                  SizedBox(height: 16),
                  Row(children: [
                    Icon(
                      Icons.phone_android,
                      size: 20,
                      color: CoreColor.primary,
                    ),
                    SizedBox(width: 8),
                    Text(
                      user.phone!,
                      style: CoreStyles.uContent,
                    )
                  ]),
                  Divider(),
                  Row(children: [
                    Icon(
                      Icons.child_care_rounded,
                      size: 20,
                      color: CoreColor.primary,
                    ),
                    SizedBox(width: 8),
                    Text(
                      user.namaAnak!,
                      style: CoreStyles.uContent,
                    )
                  ]),
                  Divider(),
                  Row(children: [
                    Icon(
                      Icons.date_range_outlined,
                      size: 20,
                      color: CoreColor.primary,
                    ),
                    SizedBox(width: 8),
                    Text(
                      user.tglLahirAnak!,
                      style: CoreStyles.uContent,
                    )
                  ]),
                  Divider(),
                  Row(children: [
                    Icon(
                      Icons.home_work,
                      size: 20,
                      color: CoreColor.primary,
                    ),
                    SizedBox(width: 8),
                    Text(
                      user.address!,
                      style: CoreStyles.uContent,
                    )
                  ]),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      authenticationManager.logOut();
                      Get.offAndToNamed(Routes.SPLASH);
                    },
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: CoreColor.primary,
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                        child: Text(
                          'Logout',
                          style: CoreStyles.uSubTitle
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
