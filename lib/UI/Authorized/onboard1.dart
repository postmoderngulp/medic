import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medic/style/texxt_style.dart';
import '../../Domain/models/OnBoard3Model.dart';
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
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
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
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: SizedBox(
                            width: 167.w,
                            height: 163.h,
                            child: Image.asset("assets/blur_shape.png")),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 60.h,
                ),
                Text(
                  "Анализы",
                  style: TexxtStyle.textLato,
                ),
                SizedBox(
                  height: 29.h,
                ),
                Text(
                  "Экспресс сбор и получение проб",
                  style: TexxtStyle.SubsubSubTitle,
                ),
                SizedBox(
                  height: 60.h,
                ),
                Image.asset("assets/groupOne.png"),
                SizedBox(
                  height: 105.h,
                ),
                SizedBox(
                    width: 204.w,
                    height: 200.h,
                    child: Image.asset("assets/analyyze.png")),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
                    child: Align(
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
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                          width: 167.w,
                          height: 163.h,
                          child: Image.asset("assets/blur_shape.png")),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 60.h,
              ),
              Text(
                "Уведомления",
                style: TexxtStyle.textLato,
              ),
              SizedBox(
                height: 29.h,
              ),
              Text(
                "Вы быстро узнаете о результатах",
                style: TexxtStyle.SubsubSubTitle,
              ),
              SizedBox(
                height: 60.h,
              ),
              Image.asset("assets/groupTwo.png"),
              SizedBox(
                height: 105.h,
              ),
              SizedBox(
                  width: 366.w,
                  height: 217.h,
                  child: Image.asset("assets/notification.png")),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
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
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: SizedBox(
                            width: 167.w,
                            height: 163.h,
                            child: Image.asset("assets/blur_shape.png")),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 60.h,
                ),
                Text(
                  "Мониторинг",
                  style: TexxtStyle.textLato,
                ),
                SizedBox(
                  height: 29.h,
                ),
                Column(
                  children: [
                    Text(
                      "Наши врачи всегда наблюдают ",
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
                SizedBox(
                  height: 42.h,
                ),
                Image.asset("assets/groupThree.png"),
                SizedBox(
                  height: 69.h,
                ),
                SizedBox(
                    width: 359.w,
                    height: 269.h,
                    child: Image.asset("assets/monitoring.png")),
              ],
            ),
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
