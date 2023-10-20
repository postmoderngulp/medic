import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 68, right: 300),
          child: SizedBox(width: 32, height: 32, child: BackButton()),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Column(
            children: [
              Text(
                "Введите код из E-mail",
                style: TexxtStyle.buttonStyleBlack,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80, top: 20),
                child: Row(
                  children: [
                    const SizedBox(
                        width: 48, height: 48, child: inputEmailCodeFirst()),
                    const SizedBox(
                      width: 10,
                    ),
                    const SizedBox(
                        width: 48, height: 48, child: inputEmailCodeSecond()),
                    const SizedBox(
                      width: 10,
                    ),
                    const SizedBox(
                        width: 48, height: 48, child: inputEmailCodeThird()),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                        width: 48,
                        height: 48,
                        child: inputEmailCodeFour(
                          email: email,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  "Отправить код повторно можно",
                  style: TexxtStyle.subSubTitle,
                ),
              ),
              const timeWidget()
            ],
          ),
        )
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
      padding: const EdgeInsets.only(top: 5),
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
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        }
        if (value.length < 1) {
          model.recoveryCode += value;
        }
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
        if (value.length < 1) {
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
        if (value.length < 1) {
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
        if (value.length < 1) {
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
