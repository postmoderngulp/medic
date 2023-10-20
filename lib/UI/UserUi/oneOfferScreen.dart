// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 310, top: 60),
            child: const SizedBox(width: 32, height: 32, child: BackButton()),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 20),
            child: Row(
              children: [
                Text(
                  "Корзина",
                  style: TexxtStyle.title,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 190),
                  child: CupertinoButton(
                      child: const ImageIcon(
                        AssetImage("assets/deleteBasket.png"),
                        color: colorrs.someGreyy,
                      ),
                      onPressed: () => model.clearBasket(context)),
                ),
              ],
            ),
          ),
          const ListProducts(),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    "Сумма",
                    style: TexxtStyle.title,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 200),
                    child: Text(
                      "$price ₽",
                      style: TexxtStyle.title,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120, bottom: 1),
            child: SizedBox(
                width: 335,
                height: 56,
                child: CupertinoButton.filled(
                  onPressed: () => model.goToPatienceOrder(context),
                  child: Text(
                    "Перейти к оформлению заказа",
                    style: TexxtStyle.buttonStyleW,
                  ),
                )),
          ),
        ],
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
        padding:
            const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
        child: SizedBox(
            width: 335,
            height: 136,
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
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16),
                  child: Text(
                    "${listSort[index].title}",
                    softWrap: true,
                    style: TexxtStyle.HeadlineMedium,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: CupertinoButton(
                    alignment: Alignment.topRight,
                    child: const ImageIcon(
                      AssetImage("assets/Delete.png"),
                      color: colorrs.someGreyy,
                    ),
                    onPressed: () =>
                        model.deleteElement(listSort[index], context)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35, left: 16),
            child: Row(
              children: [
                Text(
                  '${listSort[index].price} ₽',
                  style: TexxtStyle.priceElementText,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 145),
                  child: Row(
                    children: [
                      Text(
                        "$countVal Пациент",
                        style: TexxtStyle.blackSubTitle,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Container(
                          width: 64,
                          height: 32,
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
                                child: const ImageIcon(
                                  AssetImage("assets/min.png"),
                                  color: colorrs.iconGreyy,
                                  size: 23,
                                ),
                              ),
                              const ImageIcon(
                                AssetImage("assets/Divider.png"),
                                color: colorrs.iconGreyy,
                                size: 16,
                              ),
                              GestureDetector(
                                onTap: () {
                                  model.plusCount(listSort[index]);
                                },
                                child: const ImageIcon(
                                  AssetImage("assets/pluss.png"),
                                  color: colorrs.iconGreyy,
                                  size: 23,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
