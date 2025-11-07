import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad/core/ui/app_button.dart';
import 'package:tharad/core/ui/app_image.dart';
import 'package:tharad/core/ui/app_input.dart';

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
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ).copyWith(top: 60.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppImage(imageUrl: 'logo.png', height: 58.h, width: 178.w),
                SizedBox(height: 80.h),
                Text(
                  'إنشاء حساب جديد',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12.h),
                _Text(text: "البريد الإلكتروني"),
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
                _Text(text: "كلمة المرور"),
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
                        const Text("تذكرني"),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        // TODO: Forgot password action
                      },
                      child: const Text('هل نسيت كلمة المرور؟'),
                    ),
                  ],
                ),

                SizedBox(height: 40.h),
                AppButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  text: 'تسجيل الدخول',
                  // color: Color(0xffD75D72),
                  height: 55.h,
                  width: 350.w,
                ),
                SizedBox(height: 12.h),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'ليس لديك حساب؟'),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            ' إنشاء حساب جديد',
                            style: TextStyle(color: Color(0xff5CC7A3)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
