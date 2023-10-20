import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medic/style/texxt_style.dart';
import '../../Domain/models/OnBoard3Model.dart';
import '../../Navigation/NavigatorClass.dart';
import 'package:provider/provider.dart';

int _currentPage = 0;

class onboard1 extends StatelessWidget {
  const onboard1({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      child: Provider(
          create: (BuildContext context) => OnBoard3Model(),
          child: const pageViewWidget()),
    );
  }
}

class pageViewWidget extends StatefulWidget {
  const pageViewWidget({super.key});

  @override
  State<pageViewWidget> createState() => _pageViewWidgetState();
}

class _pageViewWidgetState extends State<pageViewWidget> {
  final int _numePage = 3;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    final model = context.read<OnBoard3Model>();
    return SafeArea(
      child: PageView(
        physics: const ClampingScrollPhysics(),
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, bottom: 50, right: 100),
                    child: TextButton(
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                          Colors.transparent,
                        )),
                        child: Text(
                          "Пропустить",
                          style: TexxtStyle.followingTxtStyle,
                        ),
                        onPressed: () => _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn)),
                  ),
                  Image.asset("assets/blur_shape.png")
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Text(
                  "Анализы",
                  style: TexxtStyle.textLato,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  "Экспресс сбор и получение проб",
                  style: TexxtStyle.SubsubSubTitle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset("assets/groupOne.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Image.asset("assets/analyyze.png"),
              )
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, bottom: 50, right: 100),
                    child: TextButton(
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                          Colors.transparent,
                        )),
                        child: Text(
                          "Пропустить",
                          style: TexxtStyle.followingTxtStyle,
                        ),
                        onPressed: () => _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn)),
                  ),
                  Image.asset("assets/blur_shape.png")
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Text(
                  "Уведомления",
                  style: TexxtStyle.textLato,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  "Вы быстро узнаете о результатах",
                  style: TexxtStyle.SubsubSubTitle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset("assets/groupTwo.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Image.asset("assets/notification.png"),
              )
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, bottom: 50, right: 100),
                    child: TextButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                        Colors.transparent,
                      )),
                      child: Text(
                        "Завершить",
                        style: TexxtStyle.followingTxtStyle,
                      ),
                      onPressed: () => model.goToMain(context),
                    ),
                  ),
                  Image.asset("assets/blur_shape.png")
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Text(
                  "Мониторинг",
                  style: TexxtStyle.textLato,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    Text(
                      "Наши врачи всегда наблюдают",
                      style: TexxtStyle.SubsubSubTitle,
                      softWrap: true,
                    ),
                    Text(
                      "за вашими показателями здоровья",
                      style: TexxtStyle.SubsubSubTitle,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset("assets/groupThree.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Image.asset("assets/monitoring.png"),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class FollowingButton extends StatefulWidget {
  const FollowingButton({super.key});

  @override
  State<FollowingButton> createState() => _FollowingButtonState();
}

class _FollowingButtonState extends State<FollowingButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
        Colors.transparent,
      )),
      child: Text(
        "Пропустить",
        style: TexxtStyle.followingTxtStyle,
      ),
      onPressed: () => setState(() {
        _currentPage = 1;
      }),
    );
  }
}

class FollowingButton2 extends StatefulWidget {
  const FollowingButton2({super.key});

  @override
  State<FollowingButton2> createState() => _FollowingButton2State();
}

class _FollowingButton2State extends State<FollowingButton2> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
        Colors.transparent,
      )),
      child: Text(
        "Пропустить",
        style: TexxtStyle.followingTxtStyle,
      ),
      onPressed: () => setState(() {
        _currentPage = 2;
      }),
    );
  }
}
