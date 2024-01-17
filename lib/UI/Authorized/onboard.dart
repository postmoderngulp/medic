import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medic/style/colorrs.dart';
import 'package:medic/style/texxt_style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../Domain/models/OnBoard3Model.dart';
import 'package:provider/provider.dart';

class onboard1 extends StatelessWidget {
  const onboard1({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
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
  late int currentPage;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    currentPage = 0;
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.read<OnBoard3Model>();
    return SafeArea(
      child: Stack(
        children: [
          PageView(
            physics: const BouncingScrollPhysics(),
            controller: _pageController,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 30.w,
                        ),
                        TextButton(
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                              Colors.transparent,
                            )),
                            child: Text(
                              "Пропустить",
                              style: TexxtStyle.followingTxtStyle,
                            ),
                            onPressed: () => _pageController.animateToPage(2,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn)),
                        SizedBox(
                          width: 44.w,
                        ),
                        SizedBox(
                            width: 167.w,
                            height: 163.h,
                            child: Image.asset("assets/blur_shape.png")),
                      ],
                    ),
                    SizedBox(
                      height: 60.89.h,
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
                      height: 165.71.h,
                    ),
                    SvgPicture.asset(
                      'assets/analyze.svg',
                      width: 204.w,
                      height: 200.h,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 30.w,
                        ),
                        TextButton(
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                              Colors.transparent,
                            )),
                            child: Text(
                              "Пропустить",
                              style: TexxtStyle.followingTxtStyle,
                            ),
                            onPressed: () => _pageController.animateToPage(2,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn)),
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
                      height: 58.89.h,
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
                      height: 165.71.h,
                    ),
                    SizedBox(
                        width: 366.w,
                        height: 217.h,
                        child: Image.asset("assets/notification.png")),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 30.w,
                        ),
                        TextButton(
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
                      height: 58.9.h,
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
                      height: 110.71.h,
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
          Center(
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              onDotClicked: (index) => _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              ),
              effect: WormEffect(
                  activeDotColor: colorrs.dot,
                  paintStyle: PaintingStyle.stroke,
                  dotColor: Colors.blue.shade50,
                  dotWidth: 12.6.w,
                  dotHeight: 12.6.h),
            ),
          )
        ],
      ),
    );
  }
}
