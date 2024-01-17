import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medic/style/colorrs.dart';
import 'package:medic/style/texxt_style.dart';
import 'package:provider/provider.dart';
import '../../Domain/models/main_screen_model.dart';
import '../../Domain/models/basket_model.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
          backgroundColor: Colors.white,
          child: Material(
            child: ChangeNotifierProvider(
                create: (BuildContext context) => mainScreenModel(),
                child: const SubWidget()),
          )),
    );
  }
}

class SubWidget extends StatelessWidget {
  const SubWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<mainScreenModel>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 24.h,
        ),
        const FindAnalyzes(),
        Expanded(
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 32.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'Акции и новости',
                  style: TexxtStyle.mainSubText,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(height: 152.h, child: const ListOfBanners()),
              SizedBox(
                height: 32.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'Каталог анализов',
                  style: TexxtStyle.mainSubText,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(height: 48.h, child: const Buttons()),
              SizedBox(
                height: 24.h,
              ),
              const ListProducts(),
            ],
          )),
        ),
        model.basketList.isNotEmpty
            ? Provider(
                create: (BuildContext context) => subBasketModel(),
                child: const basketWidget())
            : const SizedBox.shrink(),
      ],
    );
  }
}

class FindAnalyzes extends StatelessWidget {
  const FindAnalyzes({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SizedBox(
        width: 335.w,
        height: 48.h,
        child: CupertinoTextField(
          prefix: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SvgPicture.asset(
              "assets/search.svg",
              width: 20.w,
              height: 20.h,
            ),
          ),
          placeholder: "Искать анализы",
          placeholderStyle: TexxtStyle.placeHolderSTyle,
          decoration: const BoxDecoration(
            color: colorrs.greyy,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}

class ListOfBanners extends StatelessWidget {
  const ListOfBanners({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => BannerItem(
              index: index,
              length: 10,
            ));
  }
}

class BannerItem extends StatelessWidget {
  int length;
  int index;
  BannerItem({super.key, required this.index, required this.length});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: index == length - 1
          ? EdgeInsets.only(left: 16.w, right: 20.w)
          : EdgeInsets.only(left: 16.w),
      child: Image.asset('assets/Banner.png'),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<mainScreenModel>();
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: model.catalog.length,
        itemBuilder: (BuildContext context, int index) => Padding(
              padding: index == model.catalog.length - 1
                  ? EdgeInsets.only(left: 16.w, right: 20.w)
                  : EdgeInsets.only(left: 16.w),
              child: ItemCatalog(index: index),
            ));
  }
}

class ItemCatalog extends StatelessWidget {
  int index;
  ItemCatalog({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<mainScreenModel>();
    return ElevatedButton(
      style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(0),
          backgroundColor: MaterialStatePropertyAll(
              model.Index == index ? colorrs.accent : colorrs.greyy),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
      onPressed: () => model.setVal(index),
      child: Text(
        model.catalog[index],
        style: model.Index == index
            ? TexxtStyle.chipSelectText
            : TexxtStyle.chipUnSelectText,
      ),
    );
  }
}

class ListProducts extends StatelessWidget {
  const ListProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<mainScreenModel>();
    return Center(
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: model.listAnalyse.length,
        itemBuilder: (context, index) => Padding(
          padding: index == 0
              ? EdgeInsets.symmetric(horizontal: 20.w)
              : index == model.listAnalyse.length - 1
                  ? EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w)
                  : EdgeInsets.only(top: 16.h, right: 20.w, left: 20.w),
          child: SizedBox(
            width: 335.w,
            height: 136.h,
            child: ElementProducts(
              index: index,
            ),
          ),
        ),
      ),
    );
  }
}

class ElementProducts extends StatelessWidget {
  int index;
  ElementProducts({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final modelTwo = context.watch<mainScreenModel>();
    return GestureDetector(
      onTap: () => showModalBottomSheet<dynamic>(
        elevation: 7.0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24))),
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return bannerWidget(
            model: modelTwo,
            index: index,
          );
        },
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 3, // changes position of shadow
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 16.h,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  "${modelTwo.listAnalyse[index].title}",
                  softWrap: true,
                  style: TexxtStyle.HeadlineMedium,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${modelTwo.listAnalyse[index].days} дня',
                            style: TexxtStyle.Caption,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            '${modelTwo.listAnalyse[index].price} ₽',
                            style: TexxtStyle.priceElementText,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.w,
                          ),
                          child: modelTwo.basketList
                                  .contains(modelTwo.listAnalyse[index])
                              ? SizedBox(
                                  height: 40.h,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          elevation:
                                              const MaterialStatePropertyAll(0),
                                          backgroundColor:
                                              const MaterialStatePropertyAll(
                                                  Colors.transparent),
                                          shape: MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                            side: const BorderSide(
                                                width: 1,
                                                color: colorrs.accent),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ))),
                                      child: Text(
                                        'Убрать',
                                        style: TexxtStyle.buttonElementTextblue,
                                      ),
                                      onPressed: () =>
                                          modelTwo.removeAnalyse(index)))
                              : SizedBox(
                                  height: 40.h,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          elevation:
                                              const MaterialStatePropertyAll(0),
                                          backgroundColor:
                                              const MaterialStatePropertyAll(
                                                  colorrs.accent),
                                          shape: MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)))),
                                      child: Text(
                                        'Добавить',
                                        style: TexxtStyle.buttonElementText,
                                      ),
                                      onPressed: () => modelTwo.addAnalyse(index))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class basketWidget extends StatelessWidget {
  const basketWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var price = 0;
    final model = context.read<subBasketModel>();
    final modelTwo = context.watch<mainScreenModel>();
    for (int i = 0; i < modelTwo.basketList.length; i++) {
      price += modelTwo.basketList[i].price;
    }
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: 104.h,
      child: Center(
        child: SizedBox(
          width: 335.w,
          height: 56.h,
          child: TextButton.icon(
            style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                backgroundColor:
                    const MaterialStatePropertyAll(colorrs.accent)),
            onPressed: () => model.goToBasket(context),
            icon: SvgPicture.asset(
              'assets/basket.svg',
              width: 20.w,
              height: 20.h,
            ),
            label: Text("В корзину                  $price ₽",
                style: TexxtStyle.buttonStyleWhite),
          ),
        ),
      ),
    );
  }
}

class bannerWidget extends StatelessWidget {
  int index;
  mainScreenModel model;
  bannerWidget({super.key, required this.index, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 24.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "${model.listAnalyse[index].title}",
                    style: TexxtStyle.title2Text,
                    softWrap: true,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: SvgPicture.asset(
                    "assets/cancel.svg",
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              "Описание",
              style: TexxtStyle.headlineText,
            ),
            SizedBox(height: 8.h),
            Text(
              "${model.listAnalyse[index].description}",
              softWrap: true,
              style: TexxtStyle.subTitle,
            ),
            SizedBox(height: 16.h),
            Text(
              "Подготовка",
              style: TexxtStyle.headlineText,
            ),
            SizedBox(height: 8.h),
            Text(
              "${model.listAnalyse[index].preparation}",
              style: TexxtStyle.subTitle,
              softWrap: true,
            ),
            SizedBox(
              height: 57.h,
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Результаты через:",
                      style: TexxtStyle.Caption,
                    ),
                    Text(
                      "${model.listAnalyse[index].resultDuring} день",
                      style: TexxtStyle.HeadlineMedium,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Биоматериал:",
                      style: TexxtStyle.Caption,
                    ),
                    Text(
                      "${model.listAnalyse[index].biomaterial}",
                      style: TexxtStyle.HeadlineMedium,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 19.h,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 40.h),
              child: SizedBox(
                  width: 335.w,
                  height: 56.h,
                  child: addCardButton(
                    index: index,
                    model: model,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class addCardButton extends StatelessWidget {
  int index;
  mainScreenModel model;
  addCardButton({
    super.key,
    required this.index,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: model.basketList.contains(model.listAnalyse[index])
          ? ButtonStyle(
              backgroundColor:
                  const MaterialStatePropertyAll(colorrs.inactiveAccent),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))))
          : ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(colorrs.accent),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)))),
      onPressed: model.basketList.contains(model.listAnalyse[index])
          ? null
          : () {
              model.addAnalyse(index);
              Navigator.pop(context);
            },
      child: Text(
        "Добавить за ${model.listAnalyse[index].price} ₽",
        style: TexxtStyle.buttonStyleWhite,
      ),
    );
  }
}
