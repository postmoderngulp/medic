// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medic/style/colorrs.dart';
import 'package:medic/style/texxt_style.dart';
import 'package:provider/provider.dart';
import '../../Domain/models/one_offer_screen_model.dart';

class oneOfferScreen extends StatelessWidget {
  const oneOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
          backgroundColor: Colors.white,
          child: ListenableProvider(
              create: (BuildContext context) => oneOfferScreenModel(),
              child: const subOneOfferScreen())),
    );
  }
}

class subOneOfferScreen extends StatelessWidget {
  const subOneOfferScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final model = context.watch<oneOfferScreenModel>();
    var price = 0;
    for (int i = 0; i < model.listBasket.length; i++) {
      price += model.listBasket[i].price;
    }
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16.h,
            ),
            BackButton(),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Корзина",
                  style: TexxtStyle.title,
                ),
                Spacer(),
                CupertinoButton(
                    child: SvgPicture.asset(
                      'assets/delBasket.svg',
                      width: 20.w,
                      height: 20.h,
                    ),
                    onPressed: () => model.clearBasket(context)),
              ],
            ),
            SizedBox(
              height: 32.h,
            ),
            const ListProducts(),
            SizedBox(
              height: 40.h,
            ),
            Row(
              children: [
                Text(
                  "Сумма",
                  style: TexxtStyle.title,
                ),
                Spacer(),
                Text(
                  "$price ₽",
                  style: TexxtStyle.title,
                ),
              ],
            ),
            SizedBox(
              height: 155.h,
            ),
            SizedBox(
                width: 335.w,
                height: 64.h,
                child: CupertinoButton.filled(
                  onPressed: () => model.goToPatienceOrder(context),
                  child: Text(
                    "Перейти к оформлению заказа",
                    style: TexxtStyle.buttonStyleW,
                  ),
                )),
            SizedBox(
              height: 32.h,
            ),
          ],
        ),
      ),
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
        width: 32.w,
        height: 32.h,
        decoration: BoxDecoration(
            color: colorrs.greyy, borderRadius: BorderRadius.circular(8)),
        child: const ImageIcon(
          AssetImage("assets/back_icon.png"),
          color: colorrs.backGrey,
        ),
      ),
    );
  }
}

class ListProducts extends StatelessWidget {
  const ListProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<oneOfferScreenModel>();
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: model.listSort.length,
      itemBuilder: (context, index) => Padding(
        padding: index == model.listSort.length - 1
            ? EdgeInsets.only(bottom: 0.h)
            : EdgeInsets.only(bottom: 16.h),
        child: SizedBox(
            width: 335.w,
            height: 138.h,
            child: basketsElementProducts(
              index: index,
            )),
      ),
    );
  }
}

class basketsElementProducts extends StatelessWidget {
  int index;
  basketsElementProducts({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    int countVal = 0;
    final model = context.watch<oneOfferScreenModel>();
    for (int i = 0; i < model.listBasket.length; i++) {
      if (model.listSort[index] == model.listBasket[i]) {
        countVal++;
      }
    }
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 3, // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 275.w,
                  child: Text(
                    "${model.listSort[index].title}",
                    softWrap: true,
                    style: TexxtStyle.HeadlineMedium,
                  ),
                ),
                Spacer(),
                GestureDetector(
                    onTap: () =>
                        model.deleteElement(model.listSort[index], context),
                    child: SvgPicture.asset(
                      'assets/Delete.svg',
                      width: 20.w,
                      height: 20.h,
                    )),
              ],
            ),
            SizedBox(
              height: 34.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${model.listSort[index].price} ₽',
                  style: TexxtStyle.priceElementText,
                ),
                Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "$countVal Пациент",
                      style: TexxtStyle.blackSubTitle,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Container(
                      width: 66.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: colorrs.greyy),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (countVal != 0) {
                                  model.minCount(
                                      model.listSort[index], context);
                                }
                              },
                              child: SvgPicture.asset(
                                'assets/min.svg',
                                width: 20.w,
                                height: 20.h,
                              ),
                            ),
                            ImageIcon(
                              AssetImage("assets/Divider.png"),
                              color: colorrs.iconGreyy,
                              size: 14.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                model.plusCount(model.listSort[index]);
                              },
                              child: SvgPicture.asset(
                                'assets/plus.svg',
                                width: 20.w,
                                height: 20.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 14.h,
            ),
          ],
        ),
      ),
    );
  }
}
