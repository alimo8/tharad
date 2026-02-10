import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad/core/logic/helper_methods.dart';
import 'package:tharad/core/ui/app_button.dart';
import 'package:tharad/core/ui/app_image.dart';
import 'package:tharad/core/ui/app_input.dart';
import 'package:tharad/core/ui/app_login_or_register.dart';
import 'package:tharad/core/ui/document_upload_widget.dart';
import 'package:tharad/generated/l10n.dart';
import 'package:tharad/main.dart';
import 'package:tharad/views/auth/otp.dart';
import 'package:tharad/views/profile/profile.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.language),
          onPressed: () {
            final currentLocale = Localizations.localeOf(context);
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(S.of(context).change_language),
                  content: Text(
                    currentLocale.languageCode == 'ar'
                        ? S.of(context).change_to_english
                        : S.of(context).change_to_arabic,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(S.of(context).no),
                    ),
                    TextButton(
                      onPressed: () {
                        if (currentLocale.languageCode == 'ar') {
                          MyApp.setLocale(context, const Locale('en'));
                        } else {
                          MyApp.setLocale(context, const Locale('ar'));
                        }
                        Navigator.pop(context);
                      },
                      child: Text(S.of(context).yes),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(top: 60.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppImage(imageUrl: 'logo.png', height: 58.h, width: 178.w),
                SizedBox(height: 40.h),
                Text(
                  S.of(context).sign_up,
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 24.h),
                _Text(text: S.of(context).profile_image),
                SizedBox(height: 6.h),
                DocumentUploadWidget(),
                SizedBox(height: 12.h),
                _Text(text: S.of(context).username),
                SizedBox(height: 6.h),
                AppInput(
                  hintText: S.of(context).username,
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter value';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                _Text(text: S.of(context).email),
                SizedBox(height: 6.h),
                AppInput(
                  hintText: 'example@gmail.com',
                  controller: mailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter value';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                _Text(text: S.of(context).password),
                SizedBox(height: 6.h),
                AppInput(
                  hintText: '******************',
                  isPassword: true,
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter value';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                _Text(text: S.of(context).confirm_password),
                SizedBox(height: 6.h),
                AppInput(
                  hintText: '******************',
                  isPassword: true,
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter value';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40.h),
                AppButton(
                  onPressed: () {
                    // if (formKey.currentState!.validate()) {

                    // }
                    goTo(OtpView());
                  },
                  text: S.of(context).sign_up,
                  // color: Color(0xffD75D72),
                  height: 55.h,
                  width: 350.w,
                ),
                SizedBox(height: 43.h),
                AppLoginOrRegister(isLogin: false),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        text,
        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
      ),
    );
  }
}
