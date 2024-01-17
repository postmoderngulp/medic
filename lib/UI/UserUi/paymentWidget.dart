import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medic/style/colorrs.dart';
import 'package:flutter/material.dart';
import 'package:medic/style/texxt_style.dart';

import '../../Navigation/NavigatorClass.dart';

class paymentWidget extends StatefulWidget {
  const paymentWidget({super.key});

  @override
  State<paymentWidget> createState() => _paymentWidgetState();
}

class _paymentWidgetState extends State<paymentWidget> {
  late Timer _timer;
  late Timer _timerTwo;
  late Timer _timerThree;
  double turns = 0.0;

  void StartTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 200), (Timer timer) {
      _changeRotation();
    });
    _timerThree = Timer(const Duration(seconds: 2), () {
      _timerThree.cancel();
    });
    _timerTwo = Timer(const Duration(seconds: 5), () {
      setState(() {
        _timer.cancel();
        _timerTwo.cancel();
      });
    });
  }

  void _changeRotation() {
    setState(() => turns += 1.0 / 8.0);
  }

  @override
  initState() {
    StartTimer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Wrap(),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Оплата",
            style: TexxtStyle.title2Text,
          ),
          centerTitle: true,
        ),
        body: _timer.isActive
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedRotation(
                      turns: turns,
                      duration: const Duration(milliseconds: 200),
                      child: SvgPicture.asset(
                        'assets/progressRound.svg',
                        width: 66.w,
                        height: 66.h,
                      ),
                    ),
                    SizedBox(height: 26.h),
                    Text(
                      _timerThree.isActive
                          ? "Связываемся с банком..."
                          : "Производим оплату...",
                      style: TexxtStyle.bankTxtStyle,
                    )
                  ],
                ),
              )
            : const successPaymentWidget(),
      ),
    );
  }
}

class successPaymentWidget extends StatelessWidget {
  const successPaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 81.h,
        ),
        SvgPicture.asset(
          "assets/analyze.svg",
          width: 204.w,
          height: 200.h,
        ),
        SizedBox(
          height: 30.53.h,
        ),
        Text(
          "Ваш заказ успешно оплачен!",
          style: TexxtStyle.textLato,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "Вам осталось дождаться приезда медсестры",
          style: TexxtStyle.SubsubSubTitle,
          textAlign: TextAlign.center,
        ),
        Text(
          "и сдать анализы. До скорой встречи!",
          style: TexxtStyle.SubsubSubTitle,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 8.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TexxtStyle.SubsubSubTitle,
              children: [
                TextSpan(
                    text: 'Не забудьте ознакомиться с ',
                    style: TexxtStyle.SubsubSubTitle),
                WidgetSpan(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                    child: SvgPicture.asset(
                      'assets/doc.svg',
                      width: 12.8.w,
                      height: 12.8.h,
                    ),
                  ),
                ),
                TextSpan(
                    text: 'правилами подготовки к сдаче анализов',
                    style: TexxtStyle.SubsubSubTitleBlue),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 119.h,
        ),
        const chequeButton(),
        SizedBox(
          height: 20.h,
        ),
        const onMainButton(),
        SizedBox(
          height: 32.h,
        ),
      ],
    );
  }
}

class chequeButton extends StatelessWidget {
  const chequeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      height: 56,
      child: ElevatedButton(
        style: const ButtonStyle(
            elevation: MaterialStatePropertyAll(0),
            shadowColor: MaterialStatePropertyAll(Colors.transparent),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
            backgroundColor: MaterialStatePropertyAll(Colors.transparent),
            side: MaterialStatePropertyAll(BorderSide(color: colorrs.accent))),
        onPressed: () {},
        child: Text(
          "Чек покупки",
          style: TexxtStyle.buttonStyleAccent,
        ),
      ),
    );
  }
}

class onMainButton extends StatelessWidget {
  const onMainButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      height: 56,
      child: CupertinoButton.filled(
        onPressed: () =>
            Navigator.pushNamed(context, NavigatorPaths.mainScreenCardPath),
        child: Text(
          "На главную",
          style: TexxtStyle.buttonStyleWhite,
        ),
      ),
    );
  }
}
