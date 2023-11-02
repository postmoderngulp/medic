import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medic/style/colorrs.dart';
import 'package:medic/style/texxt_style.dart';
import 'package:provider/provider.dart';
import '../../Domain/models/emailCodePassword.dart';

class InputEmailCodeWidget extends StatelessWidget {
  String email;
  InputEmailCodeWidget({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          child: Provider(
              create: (BuildContext context) => emailCodePasswordModel(),
              child: EmailCodeWidget(
                email: email,
              ))),
    );
  }
}

class EmailCodeWidget extends StatelessWidget {
  String email;
  EmailCodeWidget({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<emailCodePasswordModel>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 24.h,
          ),
          child: const SizedBox(width: 32, height: 32, child: BackButton()),
        ),
        SizedBox(height: 132.h),
        Column(
          children: [
            Text(
              "Введите код из E-mail",
              style: TexxtStyle.buttonStyleBlack,
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: 44.w,
                    height: 48.h,
                    child: const inputEmailCodeFirst()),
                SizedBox(
                  width: 10.w,
                ),
                SizedBox(
                    width: 48.w,
                    height: 48.h,
                    child: const inputEmailCodeSecond()),
                SizedBox(
                  width: 10.w,
                ),
                SizedBox(
                    width: 48.w,
                    height: 48.h,
                    child: const inputEmailCodeThird()),
                SizedBox(
                  width: 10.w,
                ),
                SizedBox(
                    width: 48.w,
                    height: 48.h,
                    child: inputEmailCodeFour(
                      email: email,
                    )),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "Отправить код повторно можно",
              style: TexxtStyle.subSubTitle,
            ),
            const timeWidget()
          ],
        ),
      ],
    );
  }
}

class timeWidget extends StatefulWidget {
  const timeWidget({super.key});

  @override
  State<timeWidget> createState() => _timeWidgetState();
}

class _timeWidgetState extends State<timeWidget> {
  late Timer _timer;
  int sec = 60;
  void timeSec() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        sec--;
        if (sec == 0) {
          sec = 60;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    timeSec();
  }

  @override
  dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Text("будет через $sec сек", style: TexxtStyle.subSubTitle),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        decoration: BoxDecoration(
            color: colorrs.greyy, borderRadius: BorderRadius.circular(8)),
        child: const ImageIcon(
          AssetImage("assets/back_icon.png"),
          color: colorrs.iconGreyy,
        ),
      ),
    );
  }
}

class inputEmailCodeFirst extends StatelessWidget {
  const inputEmailCodeFirst({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<emailCodePasswordModel>();
    return CupertinoTextField(
      keyboardType: TextInputType.number,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      autofocus: true,
      onChanged: (value) {
        model.recoveryCode += value;
        FocusScope.of(context).nextFocus();
      },
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.center,
      decoration: const BoxDecoration(
        color: colorrs.greyy,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}

class inputEmailCodeSecond extends StatelessWidget {
  const inputEmailCodeSecond({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<emailCodePasswordModel>();
    return CupertinoTextField(
      keyboardType: TextInputType.number,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        }
        if (value.isEmpty) {
          model.recoveryCode += value;
        }
      },
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
      decoration: const BoxDecoration(
        color: colorrs.greyy,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}

class inputEmailCodeThird extends StatelessWidget {
  const inputEmailCodeThird({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<emailCodePasswordModel>();
    return CupertinoTextField(
      keyboardType: TextInputType.number,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        }
        if (value.isEmpty) {
          model.recoveryCode += value;
        }
      },
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
      decoration: const BoxDecoration(
        color: colorrs.greyy,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}

class inputEmailCodeFour extends StatelessWidget {
  String email;
  inputEmailCodeFour({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<emailCodePasswordModel>();
    return CupertinoTextField(
      keyboardType: TextInputType.number,
      onEditingComplete: () {
        FocusScope.of(context).unfocus();
        model.sendRecoveryCode(email, model.recoveryCode, context);
      },
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).unfocus();
          model.sendRecoveryCode(email, model.recoveryCode, context);
        }
        if (value.isEmpty) {
          model.recoveryCode += value;
        }
      },
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
      decoration: const BoxDecoration(
        color: colorrs.greyy,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
