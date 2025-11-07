import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tharad/core/ui/app_button.dart';
import 'package:tharad/core/ui/app_image.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
        ).copyWith(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImage(imageUrl: 'logo.png', height: 58.h, width: 178.w),
            SizedBox(height: 116.h),
            Text(
              'Verify Code',
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(
              textAlign: TextAlign.center,
              ' لاستكمال فتح حسابك ادخل رمز التحقق المرسل عبر البريد الإلكتروني',
              style: TextStyle(fontSize: 15.sp, color: Colors.grey),
            ),
            SizedBox(height: 40.h),
            PinCodeTextField(
              appContext: context,
              length: 4,
              cursorColor: Colors.black,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(12.r),
                fieldHeight: 55.h,
                fieldWidth: 50.w,
                activeColor: Colors.blue,
                selectedColor: Colors.pink,
                inactiveColor: Colors.grey,
              ),
              onChanged: (value) {
                // pinCode = value;
              },
            ),
            // SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('55.55'),

                Text.rich(
                  style: TextStyle(fontSize: 12.sp),
                  textAlign: TextAlign.end,
                  TextSpan(
                    children: [
                      TextSpan(text: 'لم يصلك رمز؟ '),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: TextButton(
                          onPressed: () {
                            // Navigator.pop(context);
                          },
                          child: Text(
                            'إعادة ارسال',
                            style: TextStyle(
                              color: Color(0xff5CC7A3),
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
            AppButton(
              onPressed: () {},
              text: 'المتابعة',
              // color: Color(0xffD75D72),
              height: 55.h,
              width: 350.w,
            ),
            SizedBox(height: 43.h),
          ],
        ),
      ),
    );
  }
}
