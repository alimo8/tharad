import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad/core/logic/helper_methods.dart';
import 'package:tharad/core/ui/app_button.dart';
import 'package:tharad/core/ui/app_image.dart';
import 'package:tharad/core/ui/app_input.dart';
import 'package:tharad/core/ui/app_login_or_register.dart';
import 'package:tharad/generated/l10n.dart';
import 'package:tharad/views/profile/profile.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool value = false;
  final formKey = GlobalKey<FormState>();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 20.w,
            ).copyWith(top: 60.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppImage(imageUrl: 'logo.png', height: 58.h, width: 178.w),
                SizedBox(height: 80.h),
                Text(
                  S.of(context).login,
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
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

                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: value,
                          onChanged: (newValue) {
                            setState(() => value = newValue ?? false);
                          },
                          visualDensity: VisualDensity.compact,
                        ),
                        Text(S.of(context).remember_me),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(S.of(context).forgot_password),
                    ),
                  ],
                ),

                SizedBox(height: 40.h),
                AppButton(
                  onPressed: () {
                    // if (formKey.currentState!.validate()) {}
                    goTo(ProfileView());
                  },
                  text: S.of(context).login,
                  height: 55.h,
                  width: 350.w,
                ),
                SizedBox(height: 12.h),
                AppLoginOrRegister(),
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
