import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad/core/logic/helper_methods.dart';
import 'package:tharad/generated/l10n.dart';
import 'package:tharad/views/auth/login.dart';
import 'package:tharad/views/auth/register.dart';

class AppLoginOrRegister extends StatefulWidget {
  final bool isLogin;

  const AppLoginOrRegister({super.key, this.isLogin = true});

  @override
  State<AppLoginOrRegister> createState() => _AppLoginOrRegisterState();
}

class _AppLoginOrRegisterState extends State<AppLoginOrRegister> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          children: [
            TextSpan(
              text: widget.isLogin
                  ? S.of(context).dont_have_an_account
                  : S.of(context).have_account,
              style: TextStyle(color: Colors.grey, fontSize: 18.sp),
            ),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: TextButton(
                style: TextButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.symmetric(horizontal: 2),
                ),
                child: Text(
                  widget.isLogin ? S.of(context).sign_up : S.of(context).login,
                  style: TextStyle(
                    color: Color(0xff5CC7A3),
                    fontSize: 18.sp,
                    // fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                  if (widget.isLogin) {
                    goTo(RegisterView());
                    setState(() {});
                  } else {
                    goTo(LoginView(), canPop: false);
                    setState(() {});
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
