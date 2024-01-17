import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medic/style/colorrs.dart';
import 'package:medic/style/texxt_style.dart';
import 'package:medic/Navigation/NavigatorClass.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/adapters.dart';
import 'Domain/models/first_window_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  NavigateService serviceNavigate = NavigateService();
  runApp(ScreenUtilInit(
    builder: (BuildContext context, child) => CupertinoApp(
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      initialRoute: serviceNavigate.initialRoute,
      routes: serviceNavigate.routes,
      debugShowCheckedModeBanner: false,
    ),
    designSize: const Size(375, 812),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (BuildContext context) => firstWindowModel(),
        child: const firstWidgetEnter());
  }
}

class firstWidgetEnter extends StatefulWidget {
  const firstWidgetEnter({super.key});

  @override
  State<firstWidgetEnter> createState() => _firstWidgetEnterState();
}

class _firstWidgetEnterState extends State<firstWidgetEnter> {
  bool emailValid = false;
  @override
  Widget build(BuildContext context) {
    final model = context.watch<firstWindowModel>();
    return SafeArea(
      child: CupertinoPageScaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 59.h,
                  ),
                  Row(
                    children: [
                      Image.asset("assets/hello.png"),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Добро пожаловать!",
                        style: TexxtStyle.title,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                  Text(
                    "Войдите, чтобы пользоваться функциями приложения",
                    style: TexxtStyle.subTitle,
                  ),
                  SizedBox(
                    height: 64.h,
                  ),
                  Text(
                    "Вход по E-mail",
                    style: TexxtStyle.subSubTitle,
                  ),
                  SizedBox(
                      width: 335.w,
                      height: 48.h,
                      child: CupertinoTextField(
                        onChanged: (value) {
                          model.email = value;
                          setState(() {
                            emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(model.email);
                          });
                        },
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.w, vertical: 14.h),
                        placeholder: "example@mail.ru",
                        placeholderStyle: TexxtStyle.placeHolderSTyle,
                        decoration: const BoxDecoration(
                          color: colorrs.greyy,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      )),
                  SizedBox(
                    height: 32.h,
                  ),
                  SizedBox(
                    width: 335.w,
                    height: 56.h,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: const MaterialStatePropertyAll(0),
                          backgroundColor: MaterialStatePropertyAll(emailValid
                              ? colorrs.accent
                              : colorrs.inactiveAccent),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                      onPressed: () => emailValid
                          ? model.sendEmail(model.email, context)
                          : null,
                      child: Text(
                        "Далее",
                        style: TexxtStyle.buttonStyleWhite,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 238.h,
                  ),
                  Center(
                    child: Text(
                      "Или войдите с помощью",
                      style: TexxtStyle.subSubTitle,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  SizedBox(
                      width: 335.w,
                      height: 60.h,
                      child: const YandexEnterButton()),
                ],
              ),
            ),
          )),
    );
  }
}

class YandexEnterButton extends StatelessWidget {
  const YandexEnterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<firstWindowModel>();
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          elevation: const MaterialStatePropertyAll(0),
          backgroundColor: const MaterialStatePropertyAll(
            Colors.transparent,
          ),
          side: const MaterialStatePropertyAll(
              BorderSide(width: 1.5, color: colorrs.greyy))),
      onPressed: () => model.goToEmailCodeWidget(context, model.email),
      child: Text(
        "Войти с Яндекс",
        style: TexxtStyle.buttonStyleBlack,
      ),
    );
  }
}
