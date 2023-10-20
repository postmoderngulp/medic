import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medic/style/colorrs.dart';
import 'package:medic/style/texxt_style.dart';
import 'package:provider/provider.dart';
import '../../Domain/models/choose_tests_model.dart';
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
          create: (context) => ChooseTestModel(),
          child: ListenableProvider(
              create: (BuildContext context) => mainScreenModel(),
              child: const SubWidget()),
        )),
      ),
    );
  }
}

class SubWidget extends StatelessWidget {
  const SubWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<mainScreenModel>();
    return Column(
      children: [
        const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 50),
            child: SizedBox(width: 335, height: 48, child: FindAnalyzes()),
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, right: 200),
                child: Text(
                  'Акции и новости',
                  style: TexxtStyle.mainSubText,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 16),
                child: SizedBox(height: 160, child: ListOfBanners()),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, right: 200),
                child: Text(
                  'Каталог анализов',
                  style: TexxtStyle.mainSubText,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 20),
                child: SizedBox(height: 50, child: ButtonsWidgt()),
              ),
              const ListProducts(),
            ],
          ),
        )),
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
    return CupertinoTextField(
      prefix: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Image.asset("assets/search.png"),
      ),
      placeholder: "Искать анализы",
      placeholderStyle: TexxtStyle.placeHolderSTyle,
      decoration: const BoxDecoration(
        color: colorrs.greyy,
        borderRadius: BorderRadius.all(Radius.circular(10)),
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
        itemBuilder: (context, index) => const BannerItem());
  }
}

class BannerItem extends StatelessWidget {
  const BannerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/Banner.png');
  }
}

class ButtonsWidgt extends StatelessWidget {
  const ButtonsWidgt({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ChooseTestModel>();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        const SizedBox(
          width: 16,
        ),
        SizedBox(
          width: 126,
          height: 48,
          child: ElevatedButton(
            style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(0),
                backgroundColor: MaterialStatePropertyAll(
                    model.index == 0 ? colorrs.accent : colorrs.greyy),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)))),
            onPressed: () => model.setOne(),
            child: Text(
              'Популярные',
              style: model.index == 0
                  ? TexxtStyle.chipSelectText
                  : TexxtStyle.chipUnSelectText,
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        SizedBox(
          width: 78,
          height: 48,
          child: ElevatedButton(
            style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(0),
                backgroundColor: MaterialStatePropertyAll(
                    model.index == 1 ? colorrs.accent : colorrs.greyy),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)))),
            onPressed: () => model.setTwo(),
            child: Text(
              'Covid',
              style: model.index == 1
                  ? TexxtStyle.chipSelectText
                  : TexxtStyle.chipUnSelectText,
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        SizedBox(
          width: 136,
          height: 48,
          child: ElevatedButton(
            style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(0),
                backgroundColor: MaterialStatePropertyAll(
                    model.index == 2 ? colorrs.accent : colorrs.greyy),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)))),
            onPressed: () => model.setThree(),
            child: Text(
              'Комплексные',
              style: model.index == 2
                  ? TexxtStyle.chipSelectText
                  : TexxtStyle.chipUnSelectText,
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
      ]),
    );
  }
}

class ListProducts extends StatelessWidget {
  const ListProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<mainScreenModel>();
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: model.listAnalyse.length,
      itemBuilder: (context, index) => Padding(
        padding:
            const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
        child: SizedBox(
            width: 335,
            height: 136,
            child: ElementProducts(
              index: index,
            )),
      ),
    );
  }
}

class ElementProducts extends StatelessWidget {
  int index;
  ElementProducts({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ChooseTestModel>();
    final modelTwo = context.watch<mainScreenModel>();
    return GestureDetector(
      onTap: () => showModalBottomSheet<dynamic>(
        elevation: 2.0,
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
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, left: 16),
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
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${modelTwo.listAnalyse[index].days} дня',
                            style: TexxtStyle.Caption,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              '${modelTwo.listAnalyse[index].price} ₽',
                              style: TexxtStyle.priceElementText,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 197),
                      child: modelTwo.basketList
                              .contains(modelTwo.listAnalyse[index])
                          ? SizedBox(
                              width: 96,
                              height: 40,
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
                                            width: 1, color: colorrs.accent),
                                        borderRadius: BorderRadius.circular(10),
                                      ))),
                                  child: Text(
                                    'Убрать',
                                    style: TexxtStyle.buttonElementTextblue,
                                  ),
                                  onPressed: () =>
                                      modelTwo.removeAnalyse(index)))
                          : SizedBox(
                              width: 96,
                              height: 40,
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
                                                  BorderRadius.circular(10)))),
                                  child: Text(
                                    'Добавить',
                                    style: TexxtStyle.buttonElementText,
                                  ),
                                  onPressed: () => modelTwo.addAnalyse(index))),
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
      height: MediaQuery.of(context).size.height / 9,
      child: SizedBox(
        width: 335,
        height: 56,
        child: Center(
          child: SizedBox(
            width: 335,
            height: 56,
            child: TextButton.icon(
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  backgroundColor:
                      const MaterialStatePropertyAll(colorrs.accent)),
              onPressed: () => model.goToBasket(context),
              icon: const ImageIcon(
                AssetImage("assets/basket.png"),
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              label: Text("В корзину                  $price ₽",
                  style: TexxtStyle.buttonStyleWhite),
            ),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 24, left: 20),
                  child: Text(
                    "${model.listAnalyse[index].title}",
                    style: TexxtStyle.title2Text,
                    softWrap: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 50),
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    maximumSize: const Size(55, 55),
                    minimumSize: const Size(32, 32),
                    backgroundColor: Colors.transparent,
                  ),
                  child: Image.asset("assets/cancelButton.png"),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, right: 280),
            child: Text(
              "Описание",
              style: TexxtStyle.headlineText,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 10),
            child: Text(
              "${model.listAnalyse[index].description}",
              softWrap: true,
              style: TexxtStyle.subTitle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 270, top: 15),
            child: Text(
              "Подготовка",
              style: TexxtStyle.headlineText,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 10),
            child: Text(
              "${model.listAnalyse[index].preparation}",
              style: TexxtStyle.subTitle,
              softWrap: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 45, left: 20),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Результаты через:",
                      style: TexxtStyle.Caption,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        "${model.listAnalyse[index].resultDuring} день",
                        style: TexxtStyle.HeadlineMedium,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Column(
                    children: [
                      Text(
                        "Биоматериал:",
                        style: TexxtStyle.Caption,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25, top: 5),
                        child: Text(
                          "${model.listAnalyse[index].biomaterial}",
                          style: TexxtStyle.HeadlineMedium,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 24),
            child: SizedBox(
                width: 335,
                height: 56,
                child: addCardButton(
                  index: index,
                  model: model,
                )),
          )
        ],
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
