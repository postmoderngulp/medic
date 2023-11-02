// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medic/Domain/entity/analyse.dart';
import 'package:medic/style/colorrs.dart';
import 'package:medic/style/texxt_style.dart';
import 'package:provider/provider.dart';
import '../../Domain/models/one_offer_screen_model.dart';
import '../../Navigation/NavigatorClass.dart';

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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 52.h,
            ),
            const SizedBox(width: 32, height: 32, child: BackButton()),
            SizedBox(
              height: 24.h,
            ),
            Row(
              children: [
                Text(
                  "Корзина",
                  style: TexxtStyle.title,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: CupertinoButton(
                        child: const ImageIcon(
                          AssetImage("assets/deleteBasket.png"),
                          color: colorrs.someGreyy,
                        ),
                        onPressed: () => model.clearBasket(context)),
                  ),
                ),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Сумма",
                  style: TexxtStyle.title,
                ),
                Text(
                  "$price ₽",
                  style: TexxtStyle.title,
                ),
              ],
            ),
            SizedBox(
              height: 168.h,
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
      onTap: () =>
          Navigator.of(context).pushNamed(NavigatorPaths.mainScreenCardPath),
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

class ListProducts extends StatelessWidget {
  const ListProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<oneOfferScreenModel>();
    List<analyse> listSort = [];
    for (int i = 0; i < model.listBasket.length; i++) {
      listSort.add(model.listBasket[i]);
    }
    var list = listSort.toSet().toList();
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: 16.h),
        child: SizedBox(
            width: 335.w,
            height: 138.h,
            child: basketsElementProducts(
              index: index,
              listSort: list,
              model: model,
            )),
      ),
    );
  }
}

class basketsElementProducts extends StatelessWidget {
  oneOfferScreenModel model;
  List<analyse> listSort;
  int index;
  basketsElementProducts(
      {super.key,
      required this.listSort,
      required this.index,
      required this.model});

  @override
  Widget build(BuildContext context) {
    int countVal = 0;
    for (int i = 0; i < model.listBasket.length; i++) {
      if (listSort[index] == model.listBasket[i]) {
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
            Row(
              children: [
                SizedBox(
                  height: 16.h,
                ),
                Expanded(
                  child: Text(
                    "${listSort[index].title}",
                    softWrap: true,
                    style: TexxtStyle.HeadlineMedium,
                  ),
                ),
                CupertinoButton(
                    alignment: Alignment.topRight,
                    child: ImageIcon(
                      AssetImage("assets/Delete.png"),
                      color: colorrs.someGreyy,
                      size: 20.w,
                    ),
                    onPressed: () =>
                        model.deleteElement(listSort[index], context)),
              ],
            ),
            SizedBox(
              height: 28.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${listSort[index].price} ₽',
                  style: TexxtStyle.priceElementText,
                ),
                Row(
                  children: [
                    Text(
                      "$countVal Пациент",
                      style: TexxtStyle.blackSubTitle,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Container(
                        width: 64.w,
                        height: 32.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: colorrs.greyy),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (countVal != 0) {
                                  model.minCount(listSort[index], context);
                                }
                              },
                              child: ImageIcon(
                                AssetImage("assets/min.png"),
                                color: colorrs.iconGreyy,
                                size: 23.w,
                              ),
                            ),
                            ImageIcon(
                              AssetImage("assets/Divider.png"),
                              color: colorrs.iconGreyy,
                              size: 16.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                model.plusCount(listSort[index]);
                              },
                              child: ImageIcon(
                                AssetImage("assets/pluss.png"),
                                color: colorrs.iconGreyy,
                                size: 23.w,
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
          ],
        ),
      ),
    );
  }
}
