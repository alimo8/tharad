import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad/core/ui/app_button.dart';
import 'package:tharad/core/ui/app_image.dart';
import 'package:tharad/core/ui/app_input.dart';
import 'package:tharad/core/ui/document_upload_widget.dart';
import 'package:tharad/generated/l10n.dart';

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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          S.of(context).profile,
          style: TextStyle(color: Colors.white),
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff5CC7A3), Color(0xff265355)],
          ),
        ),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
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
                    SizedBox(height: 6.h),

                    _Text(text: S.of(context).profile_image),
                    SizedBox(height: 6.h),
                    DocumentUploadWidget(),
                    SizedBox(height: 12.h),
                    _Text(text: S.of(context).old_password),
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
                    _Text(text: S.of(context).new_password),
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
                    _Text(text: S.of(context).confirm_new_password),
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
                      text: S.of(context).save_changes,
                      height: 55.h,
                      width: 350.w,
                    ),
                    SizedBox(height: 12.h),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        S.of(context).logout,
                        style: TextStyle(color: Color(0xffFF1020)),
                      ),
                    ),

                    SizedBox(height: 16.h),
                  ],
                ),
              ),
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
