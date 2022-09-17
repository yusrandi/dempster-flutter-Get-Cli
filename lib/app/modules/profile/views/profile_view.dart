import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli_dempster_flutter/app/modules/auth/controllers/authentication_manager.dart';
import 'package:get_cli_dempster_flutter/app/modules/result/controllers/result_manager.dart';
import 'package:lottie/lottie.dart';

import '../../../cores/core_colors.dart';
import '../../../cores/core_constants.dart';
import '../../../cores/core_images.dart';
import '../../../cores/core_styles.dart';
import '../../../cores/helper/keyboard.dart';
import '../../../data/models/user_model.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);
  final ProfileController profileController = Get.put(ProfileController());
  final AuthenticationManager authenticationManager =
      Get.put(AuthenticationManager());
  final ResultManager resultManager = Get.put(ResultManager());

  final _formKey = GlobalKey<FormState>();
  final _userEmail = TextEditingController();
  final _userPass = TextEditingController();
  final _userName = TextEditingController();
  final _userAddress = TextEditingController();
  final _userNamaAnak = TextEditingController();
  final _userPhone = TextEditingController();

  String? validatePass(value) {
    if (value.isEmpty) {
      return kPassNullError;
    } else if (value.length < 8) {
      return kShortPassError;
    } else {
      return null;
    }
  }

  String? validateEmail(value) {
    if (value.isEmpty) {
      return kPhoneNumberNullError;
    } else {
      return null;
    }
  }

  String? validateField(value) {
    if (value.isEmpty) {
      return kFieldNullError;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CoreColor.primary,
        centerTitle: false,
        title: Text('Profil'),
      ),
      body: Container(
        child: FutureBuilder<UserModel>(
          future: profileController.getUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            UserModel user = snapshot.data!;
            _userName.text = user.name!;
            _userNamaAnak.text = user.namaAnak!;
            _userAddress.text = user.address!;
            _userPhone.text = user.phone!;
            profileController.selectedDate.value = user.tglLahirAnak!;

            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    width: double.infinity,
                    color: CoreColor.primary,
                    child: Column(
                      children: [
                        Image.asset(CoreImages.profileImg, height: 100),
                        Text(
                          user.name!,
                          style:
                              CoreStyles.uTitle.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          emailField(
                              _userPhone,
                              validateEmail,
                              TextInputType.number,
                              'Nomor Hp',
                              Icons.phone_android_rounded),
                          SizedBox(height: 8),
                          emailField(
                              _userName,
                              validateField,
                              TextInputType.text,
                              'Nama Lengkap',
                              Icons.person_pin),
                          SizedBox(height: 8),
                          emailField(
                              _userNamaAnak,
                              validateField,
                              TextInputType.text,
                              'Nama Anak',
                              Icons.person_pin),
                          SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.parse(user.tglLahirAnak!),
                                firstDate: DateTime(1980),
                                lastDate: DateTime(DateTime.now().year + 1),
                              ).then((date) => profileController.selectedDate
                                  .value = date.toString().split(' ')[0]);
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: CoreColor.kHintTextColor),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.date_range,
                                      color: CoreColor.primary,
                                    ),
                                    SizedBox(width: 8),
                                    Obx(() => Text(
                                          profileController.selectedDate.value,
                                          style: CoreStyles.uSubTitle.copyWith(
                                              color: Colors.black,
                                              fontSize: 15),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: (8)),
                          emailField(_userAddress, validateField,
                              TextInputType.text, 'Alamat', Icons.home_rounded),
                          SizedBox(height: (8)),
                          passwordField(),
                          SizedBox(height: (26)),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: GestureDetector(
                                  onTap: () {
                                    authenticationManager.logOut();
                                    resultManager.logOut();
                                    Get.offAndToNamed(Routes.SPLASH);
                                  },
                                  child: Container(
                                    height: 40,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: CoreColor.primary,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Center(
                                      child: Text(
                                        'Logout',
                                        style: CoreStyles.uSubTitle
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () async {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();

                                      var email = _userEmail.text.trim();
                                      var password = _userPass.text.trim();
                                      var namaLengkap = _userName.text.trim();
                                      var namaAnak = _userNamaAnak.text.trim();
                                      var address = _userAddress.text.trim();
                                      var phone = _userPhone.text.trim();

                                      print(email);
                                      await profileController.userUpdate(
                                          user.id!.toString(),
                                          namaLengkap,
                                          namaAnak,
                                          address,
                                          phone);
                                      KeyboardUtil.hideKeyboard(context);
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: CoreColor.primary),
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Center(
                                        child: Obx(
                                      () => profileController.status.value ==
                                              Status.running
                                          ? loading()
                                          : Text(
                                              "Update",
                                              style: CoreStyles.uSubTitle
                                                  .copyWith(
                                                      color: CoreColor.primary),
                                            ),
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  loading() {
    return CircularProgressIndicator(color: CoreColor.primary);
  }

  Container bodyA(UserModel user) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(children: [
        Row(children: [
          Icon(
            Icons.phone_android,
            size: 20,
            color: CoreColor.primary,
          ),
          SizedBox(width: 8),
          Text(
            user.phone!,
            style: CoreStyles.uSubTitle,
          )
        ]),
        SizedBox(height: 8),
        Divider(color: Colors.black),
        SizedBox(height: 8),
        Row(children: [
          Icon(
            Icons.child_care_rounded,
            size: 20,
            color: CoreColor.primary,
          ),
          SizedBox(width: 8),
          Text(
            user.namaAnak!,
            style: CoreStyles.uSubTitle,
          )
        ]),
        SizedBox(height: 8),
        Divider(color: Colors.black),
        SizedBox(height: 8),
        Row(children: [
          Icon(
            Icons.date_range_outlined,
            size: 20,
            color: CoreColor.primary,
          ),
          SizedBox(width: 8),
          Text(
            user.tglLahirAnak!,
            style: CoreStyles.uSubTitle,
          )
        ]),
        SizedBox(height: 8),
        Divider(color: Colors.black),
        SizedBox(height: 8),
        Row(children: [
          Icon(
            Icons.home_work,
            size: 20,
            color: CoreColor.primary,
          ),
          SizedBox(width: 8),
          Text(
            user.address!,
            style: CoreStyles.uSubTitle,
          )
        ]),
        SizedBox(height: 8),
        SizedBox(height: 16),
        GestureDetector(
          onTap: () {
            authenticationManager.logOut();
            resultManager.logOut();
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
                style: CoreStyles.uSubTitle.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  TextFormField emailField(
      TextEditingController controller,
      String? Function(String?) validator,
      TextInputType inputType,
      String title,
      IconData icon) {
    return TextFormField(
      controller: controller,
      validator: validator,
      cursorColor: CoreColor.primary,
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: title,
        labelStyle: const TextStyle(color: Colors.black),

        hintText: 'Enter your $title',
        // Here is key idea

        prefixIcon: Icon(icon, color: CoreColor.primary),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: CoreColor.primary, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: CoreColor.primaryExtraSoft,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: CoreColor.kHintTextColor,
            width: 1,
          ),
        ),
      ),
    );
  }

  passwordField() {
    return Obx(() => TextFormField(
          controller: _userPass,
          cursorColor: CoreColor.primary,
          keyboardType: TextInputType.text,
          obscureText: !profileController
              .passwordVisible.value, //This will obscure text dynamically
          decoration: InputDecoration(
            labelText: 'New Password ?',
            labelStyle: const TextStyle(color: Colors.grey),

            hintText: 'New password ?',
            // Here is key idea
            suffixIcon: IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                profileController.passwordVisible.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: CoreColor.primary,
              ),
              onPressed: () {
                // Update the state i.e. toogle the state of passwordVisible variable

                profileController.passwordVisible.value =
                    !profileController.passwordVisible.value;
              },
            ),

            prefixIcon:
                Icon(Icons.lock_outline_rounded, color: CoreColor.primary),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: CoreColor.primary, width: 1),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: CoreColor.primaryExtraSoft,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: CoreColor.kHintTextColor,
                width: 1,
              ),
            ),
          ),
        ));
  }
}
