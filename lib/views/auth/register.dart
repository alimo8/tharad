import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad/core/logic/helper_methods.dart';
import 'package:tharad/core/ui/app_button.dart';
import 'package:tharad/core/ui/app_image.dart';
import 'package:tharad/core/ui/app_input.dart';
import 'package:tharad/core/ui/document_upload_widget.dart';
import 'package:tharad/views/auth/login.dart';

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
                SizedBox(height: 40.h),
                Text(
                  'إنشاء حساب جديد',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 24.h),
                _Text(text: 'الصورة الشخصية'),
                SizedBox(height: 6.h),
                DocumentUploadWidget(),
                SizedBox(height: 12.h),
                _Text(text: 'اسم المستخدم'),
                SizedBox(height: 6.h),
                AppInput(
                  hintText: 'اسم المستخدم',
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter value';
                    }
                    return null;
                  },
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
                SizedBox(height: 12.h),
                _Text(text: "تأكيد كلمة المرور"),
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
                    if (formKey.currentState!.validate()) {}
                  },
                  text: 'إنشاء حساب جديد',
                  // color: Color(0xffD75D72),
                  height: 55.h,
                  width: 350.w,
                ),
                SizedBox(height: 43.h),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'لديك حساب؟'),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: TextButton(
                          onPressed: () {
                            goTo(LoginView(), canPop: true);
                          },
                          child: Text(
                            'تسجيل الدخول',
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
