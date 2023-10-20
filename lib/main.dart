import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:medic/style/colorrs.dart';
import 'package:medic/style/texxt_style.dart';
import 'package:medic/Navigation/NavigatorClass.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/adapters.dart';
import 'Domain/Api/Api.dart';
import 'Domain/models/first_window_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  NavigateService serviceNavigate = NavigateService();
  runApp(CupertinoApp(
    localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
      DefaultMaterialLocalizations.delegate,
      DefaultWidgetsLocalizations.delegate,
    ],
    initialRoute: serviceNavigate.initialRoute,
    routes: serviceNavigate.routes,
    debugShowCheckedModeBanner: false,
    home: const MyApp(),
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
          resizeToAvoidBottomInset: false,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 103, left: 25),
                child: Row(
                  children: [
                    Image.asset("assets/hello.png"),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Добро пожаловать!",
                      style: TexxtStyle.title,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 70),
                child: Text(
                  "Войдите, чтобы пользоваться функциями",
                  style: TexxtStyle.subTitle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 250),
                child: Text(
                  "приложения",
                  style: TexxtStyle.subTitle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 245, top: 65),
                child: Text(
                  "Вход по E-mail",
                  style: TexxtStyle.subSubTitle,
                ),
              ),
              SizedBox(
                  width: 335,
                  height: 48,
                  child: CupertinoTextField(
                    onChanged: (value) {
                      model.email = value;
                      setState(() {
                        emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(model.email);
                      });
                    },
                    placeholder: "example@mail.ru",
                    placeholderStyle: TexxtStyle.placeHolderSTyle,
                    decoration: const BoxDecoration(
                      color: colorrs.greyy,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  )),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                  width: 335,
                  height: 56,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: const MaterialStatePropertyAll(0),
                        backgroundColor: MaterialStatePropertyAll(emailValid
                            ? colorrs.accent
                            : colorrs.inactiveAccent),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: () => emailValid
                        ? model.sendEmail(model.email, context)
                        : null,
                    child: Text(
                      "Далее",
                      style: TexxtStyle.buttonStyleWhite,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 240),
                child: Text(
                  "Или войдите с помощью",
                  style: TexxtStyle.subSubTitle,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: SizedBox(
                    width: 335, height: 56, child: YandexEnterButton()),
              ),
            ],
          )),
    );
  }
}

class YandexEnterButton extends StatelessWidget {
  const YandexEnterButton({super.key});

  @override
  Widget build(BuildContext context) {
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
      onPressed: () {},
      child: Text(
        "Войти с Яндекс",
        style: TexxtStyle.buttonStyleBlack,
      ),
    );
  }
}
