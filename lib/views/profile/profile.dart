import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad/core/ui/app_button.dart';
import 'package:tharad/core/ui/app_image.dart';
import 'package:tharad/core/ui/app_input.dart';
import 'package:tharad/core/ui/document_upload_widget.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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
        toolbarHeight: 80,
        title: Text('الملف الشخصي', style: TextStyle(color: Colors.white)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff5CC7A3), Color(0xff265355)],
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: CircleAvatar(
              backgroundColor: Colors.transparent.withValues(alpha: .1),
              child: AppImage(imageUrl: 'notification.svg'),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        ),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ).copyWith(top: 60.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                SizedBox(height: 6.h),

                _Text(text: 'الصورة الشخصية'),
                SizedBox(height: 6.h),
                DocumentUploadWidget(),
                SizedBox(height: 12.h),
                _Text(text: " كلمة المرور القديمة"),
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
                  text: 'حفظ التغيرات',
                  // color: Color(0xffD75D72),
                  height: 55.h,
                  width: 350.w,
                ),
                SizedBox(height: 12.h),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'تسجيل الخروج',
                    style: TextStyle(color: Color(0xffFF1020)),
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
