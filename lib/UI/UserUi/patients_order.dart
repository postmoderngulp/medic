import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medic/Domain/entity/analyse.dart';
import 'package:medic/style/colorrs.dart';
import 'package:medic/style/texxt_style.dart';
import '../../Domain/entity/person.dart';
import '../../Domain/models/patience_order_model.dart';
import 'package:provider/provider.dart';

class patientsOrder extends StatelessWidget {
  const patientsOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        child: ListenableProvider(
            create: (BuildContext context) => patienceOrderModel(),
            child: subPatienceOrder()),
      ),
    );
  }
}

class subPatienceOrder extends StatelessWidget {
  subPatienceOrder({super.key});
  int val = -1;
  @override
  Widget build(BuildContext context) {
    final model = context.watch<patienceOrderModel>();
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 60, right: 310),
            child: BackButton(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 100),
            child: Text(
              "Оформление заказа",
              style: TexxtStyle.title,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 285),
            child: Text(
              "Адрес *",
              style: TexxtStyle.subSubTitle,
            ),
          ),
          const ChooseAdressInputField(),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 250),
            child: Text(
              "Дата и время*",
              style: TexxtStyle.subSubTitle,
            ),
          ),
          ChooseDateAndTimeInputField(),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 25),
            child: Row(
              children: [
                Text(
                  "Кто будет сдавать анализы?",
                  style: TexxtStyle.subSubTitle,
                ),
                Text(
                  "*",
                  style: TexxtStyle.subSubredTitle,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
                width: 335,
                child: listPatient(
                  model: model,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: addPatientButton(
              model: model,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, right: 280),
            child: Text(
              "Телефон *",
              style: TexxtStyle.subSubTitle,
            ),
          ),
          const numberPhoneInputField(),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              children: [
                Text(
                  "Комментарий",
                  style: TexxtStyle.subSubTitle,
                ),
                const SizedBox(
                  width: 210,
                ),
                CupertinoButton(
                    child: const ImageIcon(
                      AssetImage("assets/male.png"),
                      color: Colors.black,
                    ),
                    onPressed: () {})
              ],
            ),
          ),
          const stayWishField(),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              children: [
                Text(
                  "Оплата Apple Pay",
                  style: TexxtStyle.textMedium,
                ),
                const SizedBox(
                  width: 170,
                ),
                CupertinoButton(
                  onPressed: () {},
                  child: const ImageIcon(
                    AssetImage("assets/rightIcon.png"),
                    color: colorrs.someGreyy,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              children: [
                Text(
                  "Промокод",
                  style: TexxtStyle.promoText,
                ),
                const SizedBox(
                  width: 218,
                ),
                CupertinoButton(
                  onPressed: () {},
                  child: const ImageIcon(
                    AssetImage("assets/rightIcon.png"),
                    color: colorrs.someGreyy,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: SizedBox(
              width: 335,
              height: 56,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        model.addressValide &&
                                model.commentValide &&
                                model.dayValide &&
                                model.personValide &&
                                model.phoneValide &&
                                model.priceValide &&
                                model.timeValide &&
                                model.entranceValide &&
                                model.flatValide &&
                                model.floorValide &&
                                model.heightValide &&
                                model.intercomValide &&
                                model.longitudeValide &&
                                model.widthValide
                            ? colorrs.accent
                            : colorrs.inactiveAccent),
                    elevation: const MaterialStatePropertyAll(0),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                onPressed: () => model.addressValide &&
                        model.commentValide &&
                        model.dayValide &&
                        model.personValide &&
                        model.phoneValide &&
                        model.priceValide &&
                        model.timeValide &&
                        model.entranceValide &&
                        model.flatValide &&
                        model.floorValide &&
                        model.heightValide &&
                        model.intercomValide &&
                        model.longitudeValide &&
                        model.widthValide
                    ? model.createOffer(
                        context,
                        model.adress,
                        model.dob.toString(),
                        model.personList,
                        model.phone,
                        model.price,
                        model.comment)
                    : null,
                child: Text(
                  "Заказать",
                  style: TexxtStyle.buttonStyleWhite,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      height: 32,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          decoration: BoxDecoration(
              color: colorrs.greyy, borderRadius: BorderRadius.circular(8)),
          child: const ImageIcon(
            AssetImage("assets/back_icon.png"),
            color: colorrs.iconGreyy,
          ),
        ),
      ),
    );
  }
}

class ChooseAdressInputField extends StatelessWidget {
  const ChooseAdressInputField({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<patienceOrderModel>();
    return SizedBox(
      width: 335,
      height: 48,
      child: GestureDetector(
        onTap: () => showModalBottomSheet<dynamic>(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return adressBanner(
              model: model,
            );
          },
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: colorrs.greyy,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Align(
              alignment: Alignment.centerLeft,
              child: model.addressValide &&
                      model.entranceValide &&
                      model.flatValide &&
                      model.floorValide &&
                      model.heightValide &&
                      model.intercomValide &&
                      model.longitudeValide &&
                      model.widthValide
                  ? Text(
                      "${model.adress.address}, кв ${model.adress.longitude}",
                      style: TexxtStyle.placeHolderBlackSTyle,
                    )
                  : Text(
                      "Введите ваш адрес",
                      style: TexxtStyle.placeHolderBlackSTyle,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class ChooseDateAndTimeInputField extends StatelessWidget {
  ChooseDateAndTimeInputField({super.key});
  int val = -1;
  @override
  Widget build(BuildContext context) {
    final model = context.watch<patienceOrderModel>();
    return SizedBox(
      width: 335,
      height: 48,
      child: GestureDetector(
        onTap: () => showModalBottomSheet<dynamic>(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24, left: 20),
                    child: Row(
                      children: [
                        Text(
                          "Дата и время",
                          style: TexxtStyle.title2Text,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 150),
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
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 16),
                    child: Text(
                      "Выберите дату",
                      style: TexxtStyle.subSubTitle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Center(
                        child: SizedBox(
                            width: 335,
                            height: 48,
                            child: chooseDateDropField(
                              model: model,
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 5),
                    child: Text(
                      "Выберите время",
                      style: TexxtStyle.subSubTitle,
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: listTimes(
                        model: model,
                      )),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24, top: 20),
                      child: SizedBox(
                        width: 335,
                        height: 56,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  model.dayValide && model.timeValide
                                      ? colorrs.accent
                                      : colorrs.inactiveAccent),
                              elevation: const MaterialStatePropertyAll(0),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(
                                              10)))),
                          onPressed: () => model.dayValide && model.timeValide
                              ? Navigator.of(context).pop
                              : null,
                          child: Text(
                            "Подтвердить",
                            style: TexxtStyle.buttonStyleWhite,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: colorrs.greyy,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Align(
              alignment: Alignment.centerLeft,
              child: model.dayValide && model.timeValide
                  ? Text(
                      "${model.dropValue.value} ${listTime[model.index]}",
                      style: TexxtStyle.placeHolderBlackSTyle,
                    )
                  : Text(
                      "Выберите дату и время",
                      style: TexxtStyle.placeHolderBlackSTyle,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class listPatient extends StatelessWidget {
  patienceOrderModel model;
  listPatient({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: model.personList.length,
      itemBuilder: (context, int index) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: SizedBox(
          child: dropWidget(
            model: model,
            index: index,
          ),
        ),
      ),
    );
  }
}

class dropWidget extends StatefulWidget {
  patienceOrderModel model;
  int index;
  dropWidget({super.key, required this.index, required this.model});

  @override
  State<dropWidget> createState() => _dropWidgetState();
}

class _dropWidgetState extends State<dropWidget> {
  bool el = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<patienceOrderModel>();
    return el == false
        ? GestureDetector(
            onTap: () => setState(() {
              el = !el;
            }),
            child: Container(
              decoration: const BoxDecoration(
                  color: colorrs.greyy,
                  borderRadius:
                      BorderRadiusDirectional.all(Radius.circular(10))),
              child: Row(
                children: [
                  SizedBox(
                    width: 40,
                    height: 48,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          color: colorrs.greyy),
                      child: widget.model.personList[widget.index].gender == 0
                          ? Image.asset("assets/user_icon.png")
                          : Image.asset("assets/girlUser.png"),
                    ),
                  ),
                  Container(
                      width: 260,
                      decoration: const BoxDecoration(color: colorrs.greyy),
                      child: Text(
                          "${widget.model.personList[widget.index].surname} ${widget.model.personList[widget.index].name}")),
                  Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: colorrs.greyy),
                      child: const ImageIcon(
                        AssetImage("assets/dropDownIcon.png"),
                        color: colorrs.iCGreyy,
                      )),
                ],
              ),
            ),
          )
        : Container(
            width: 335,
            decoration: BoxDecoration(
                border: Border.all(color: colorrs.greyy, width: 1),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 24, bottom: 24),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => setState(() {
                          el = !el;
                        }),
                        child: SizedBox(
                          width: 267,
                          height: 48,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: colorrs.greyy,
                                borderRadius: BorderRadiusDirectional.all(
                                    Radius.circular(10))),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 40,
                                  height: 48,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10)),
                                        color: colorrs.greyy),
                                    child: widget.model.personList[widget.index]
                                                .gender ==
                                            0
                                        ? Image.asset("assets/user_icon.png")
                                        : Image.asset("assets/girlUser.png"),
                                  ),
                                ),
                                Container(
                                    width: 190,
                                    decoration: const BoxDecoration(
                                        color: colorrs.greyy),
                                    child: Text(
                                        "${widget.model.personList[widget.index].surname} ${widget.model.personList[widget.index].name}")),
                                Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        color: colorrs.greyy),
                                    child: const ImageIcon(
                                      AssetImage("assets/dropDownIcon.png"),
                                      color: colorrs.iCGreyy,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: GestureDetector(
                          onTap: () => widget.model.delUser(widget.index),
                          child: const ImageIcon(
                            AssetImage("assets/removePatient.png"),
                            color: colorrs.greyy,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                listAnalyses(
                  model: widget.model,
                )
              ],
            ),
          );
  }
}

class addPatientButton extends StatelessWidget {
  patienceOrderModel model;
  addPatientButton({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      height: 48,
      child: ElevatedButton(
        style: const ButtonStyle(
            elevation: MaterialStatePropertyAll(0),
            shadowColor: MaterialStatePropertyAll(Colors.transparent),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
            backgroundColor: MaterialStatePropertyAll(Colors.transparent),
            side: MaterialStatePropertyAll(BorderSide(color: colorrs.accent))),
        onPressed: () => showModalBottomSheet<dynamic>(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return PatientsBanner(
              model: model,
            );
          },
        ),
        child: Text(
          "Добавить ещё пациента",
          style: TexxtStyle.buttonStyleAccent,
        ),
      ),
    );
  }
}

class addPatButton extends StatelessWidget {
  patienceOrderModel model;
  addPatButton({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      height: 48,
      child: ElevatedButton(
        style: const ButtonStyle(
            elevation: MaterialStatePropertyAll(0),
            shadowColor: MaterialStatePropertyAll(Colors.transparent),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
            backgroundColor: MaterialStatePropertyAll(Colors.transparent),
            side: MaterialStatePropertyAll(BorderSide(color: colorrs.accent))),
        onPressed: () {},
        child: Text(
          "Добавить пациента",
          style: TexxtStyle.buttonStyleAccent,
        ),
      ),
    );
  }
}

class numberPhoneInputField extends StatelessWidget {
  const numberPhoneInputField({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<patienceOrderModel>();
    return SizedBox(
      width: 335,
      height: 48,
      child: CupertinoTextField(
        keyboardType: TextInputType.phone,
        onChanged: (value) {
          model.phone = value;
          model.setPhoneValide();
        },
        placeholder: "+7 (967) 078-58-37",
        placeholderStyle: TexxtStyle.placeHolderBlackSTyle,
        decoration: const BoxDecoration(
          color: colorrs.greyy,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}

class stayWishField extends StatelessWidget {
  const stayWishField({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<patienceOrderModel>();
    return SizedBox(
      width: 335,
      height: 128,
      child: CupertinoTextField(
        onChanged: (value) {
          model.comment = value;
          model.setCommentValide();
        },
        padding: const EdgeInsets.only(left: 14, top: 14),
        placeholder: "Можете оставить свои пожелания",
        placeholderStyle: TexxtStyle.placeHolderSTyle,
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.top,
        decoration: const BoxDecoration(
          color: colorrs.greyy,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}

class adressBanner extends StatefulWidget {
  patienceOrderModel model;
  adressBanner({super.key, required this.model});

  @override
  State<adressBanner> createState() => _adressBannerState();
}

class _adressBannerState extends State<adressBanner> {
  void setup() {
    widget.model.addressValide = false;
    widget.model.entranceValide = false;
    widget.model.floorValide = false;
    widget.model.flatValide = false;
    widget.model.heightValide = false;
    widget.model.intercomValide = false;
    widget.model.longitudeValide = false;
    widget.model.widthValide = false;
  }

  @override
  void dispose() {
    if (!widget.model.saveVal) {
      setup();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      width: MediaQuery.of(context).size.width,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Padding(
          padding: const EdgeInsets.only(top: 24, left: 20),
          child: Row(
            children: [
              Text(
                "Адрес сдачи анализов",
                style: TexxtStyle.title2Text,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 120),
                child: Image.asset("assets/mapImage.png"),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 270),
                child: Text(
                  "Ваш адрес",
                  style: TexxtStyle.subSubTitle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: addressInputField(model: widget.model),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5, right: 90),
                      child: Text(
                        "Долгота",
                        style: TexxtStyle.subSubTitle,
                      ),
                    ),
                    longitudeInputField(
                      model: widget.model,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5, right: 90),
                      child: Text(
                        "Широта",
                        style: TexxtStyle.subSubTitle,
                      ),
                    ),
                    latitudeInputField(
                      model: widget.model,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, bottom: 5),
                        child: Text(
                          "Высота",
                          style: TexxtStyle.subSubTitle,
                        ),
                      ),
                      heightInputField(
                        model: widget.model,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5, right: 50),
                      child: Text(
                        "Квартира",
                        style: TexxtStyle.subSubTitle,
                      ),
                    ),
                    flatInputField(
                      model: widget.model,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5, left: 5),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, right: 50),
                        child: Text(
                          "Подъезд",
                          style: TexxtStyle.subSubTitle,
                        ),
                      ),
                      entranceInputField(
                        model: widget.model,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 75, bottom: 5),
                      child: Text(
                        "Этаж",
                        style: TexxtStyle.subSubTitle,
                      ),
                    ),
                    floorInputField(
                      model: widget.model,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 270, bottom: 5, top: 10),
          child: Text(
            "Домофон",
            style: TexxtStyle.subSubTitle,
          ),
        ),
        domofonInputField(
          model: widget.model,
        ),
        saveAddress(
          model: widget.model,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 24),
          child: ConfirmButton(
            model: widget.model,
          ),
        ),
      ]),
    );
  }
}

class saveAddress extends StatefulWidget {
  patienceOrderModel model;
  saveAddress({super.key, required this.model});

  @override
  State<saveAddress> createState() => _saveAddressState();
}

class _saveAddressState extends State<saveAddress> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 5),
      child: Row(
        children: [
          Text(
            "Сохранить этот адрес?",
            style: TexxtStyle.HeadlineMedium,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100),
            child: CupertinoSwitch(
                value: widget.model.saveVal,
                activeColor: colorrs.accent,
                onChanged: (value) {
                  setState(() {
                    widget.model.saveVal = value;
                  });
                }),
          )
        ],
      ),
    );
  }
}

class addressInputField extends StatelessWidget {
  patienceOrderModel model;
  addressInputField({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      height: 48,
      child: CupertinoTextField(
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        onChanged: (value) {
          model.adress.address = value;
          model.setAdresValide();
        },
        placeholder:
            model.addressValide ? model.adress.address : "Перекопская 22к1",
        placeholderStyle: TexxtStyle.blackSubTitle,
        decoration: const BoxDecoration(
          color: colorrs.greyy,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}

class domofonInputField extends StatelessWidget {
  patienceOrderModel model;
  domofonInputField({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      height: 48,
      child: CupertinoTextField(
        keyboardType: TextInputType.number,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        onChanged: (value) {
          model.adress.intercom = value;
          model.setIntercomValide();
        },
        placeholder: model.intercomValide ? model.adress.intercom : "188*2180",
        placeholderStyle: TexxtStyle.blackSubTitle,
        decoration: const BoxDecoration(
          color: colorrs.greyy,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}

class longitudeInputField extends StatelessWidget {
  patienceOrderModel model;
  longitudeInputField({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 48,
      child: CupertinoTextField(
        keyboardType: TextInputType.number,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        onChanged: (value) {
          model.adress.longitude = int.parse(value);
          model.setLongitudeValide();
        },
        placeholder:
            model.longitudeValide ? "${model.adress.longitude}" : "188",
        placeholderStyle: TexxtStyle.blackSubTitle,
        decoration: const BoxDecoration(
          color: colorrs.greyy,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}

class latitudeInputField extends StatelessWidget {
  patienceOrderModel model;
  latitudeInputField({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 48,
      child: CupertinoTextField(
        keyboardType: TextInputType.number,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        onChanged: (value) {
          model.adress.width = int.parse(value);
          model.setWidthValide();
        },
        placeholder: model.widthValide ? "${model.adress.width}" : "4",
        placeholderStyle: TexxtStyle.blackSubTitle,
        decoration: const BoxDecoration(
          color: colorrs.greyy,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}

class heightInputField extends StatelessWidget {
  patienceOrderModel model;
  heightInputField({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 48,
      child: CupertinoTextField(
        keyboardType: TextInputType.number,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        onChanged: (value) {
          model.adress.height = int.parse(value);
          model.setHeightValide();
        },
        placeholder: model.heightValide ? "${model.adress.height}" : "8",
        placeholderStyle: TexxtStyle.blackSubTitle,
        decoration: const BoxDecoration(
          color: colorrs.greyy,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}

class flatInputField extends StatelessWidget {
  patienceOrderModel model;
  flatInputField({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 48,
      child: CupertinoTextField(
        keyboardType: TextInputType.number,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        onChanged: (value) {
          model.adress.flat = int.parse(value);
          model.setFlatValide();
        },
        placeholder: model.flatValide ? "${model.adress.flat}" : "188",
        placeholderStyle: TexxtStyle.blackSubTitle,
        decoration: const BoxDecoration(
          color: colorrs.greyy,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}

class entranceInputField extends StatelessWidget {
  patienceOrderModel model;
  entranceInputField({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 48,
      child: CupertinoTextField(
        keyboardType: TextInputType.number,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        onChanged: (value) {
          model.adress.entrance = int.parse(value);
          model.setEntranceValide();
        },
        placeholder: model.entranceValide ? "${model.adress.entrance}" : "8",
        placeholderStyle: TexxtStyle.blackSubTitle,
        decoration: const BoxDecoration(
          color: colorrs.greyy,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}

class floorInputField extends StatelessWidget {
  patienceOrderModel model;
  floorInputField({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 48,
      child: CupertinoTextField(
        keyboardType: TextInputType.number,
        onEditingComplete: () => FocusScope.of(context).unfocus(),
        onChanged: (value) {
          model.adress.floor = int.parse(value);
          model.setFloorValide();
        },
        placeholder: model.floorValide ? "${model.adress.floor}" : "8",
        placeholderStyle: TexxtStyle.blackSubTitle,
        decoration: const BoxDecoration(
          color: colorrs.greyy,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}

List<person> listPerson = [
  person(
      name: "Эдуард",
      surname: "Тицкий",
      patronymic: "",
      birthday: "",
      gender: 0),
  person(
      name: "Елена",
      surname: "Тицкая",
      patronymic: "",
      birthday: "",
      gender: 1),
  person(
      name: "Эдуард",
      surname: "Тицкий",
      patronymic: "",
      birthday: "",
      gender: 0),
];

class PatientsBanner extends StatefulWidget {
  patienceOrderModel model;
  PatientsBanner({super.key, required this.model});

  @override
  State<PatientsBanner> createState() => _PatientsBannerState();
}

class _PatientsBannerState extends State<PatientsBanner> {
  int val = -1;

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
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 20),
            child: Row(
              children: [
                Text(
                  "Выбор пациента",
                  style: TexxtStyle.title2Text,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 150),
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
                )
              ],
            ),
          ),
          SizedBox(
            width: 335,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: listPerson.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(top: 16),
                child: GestureDetector(
                  onTap: () => setState(() {
                    val = index;
                  }),
                  child: Container(
                    decoration: BoxDecoration(
                        color: val == index ? colorrs.accent : colorrs.greyy,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(children: [
                      SizedBox(
                        width: 40,
                        height: 48,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              color: val == index
                                  ? colorrs.accent
                                  : colorrs.greyy),
                          child: listPerson[index].gender == 0
                              ? Image.asset("assets/user_icon.png")
                              : Image.asset("assets/girlUser.png"),
                        ),
                      ),
                      Text(
                        "${listPerson[index].surname} ${listPerson[index].name}",
                        style: TextStyle(
                            color: val == index ? Colors.white : Colors.black),
                      )
                    ]),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: addPatButton(
              model: widget.model,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 15),
            child: confirmButton(
              model: widget.model,
              index: val,
            ),
          ),
        ],
      ),
    );
  }
}

class chooseDateDropField extends StatefulWidget {
  patienceOrderModel model;
  DateTime dateTime = DateTime.now();
  chooseDateDropField({super.key, required this.model});

  @override
  State<chooseDateDropField> createState() => _chooseDateDropFieldState();
}

class _chooseDateDropFieldState extends State<chooseDateDropField> {
  @override
  Widget build(BuildContext context) {
    var nextDay = widget.dateTime.day + 1;
    List<String> dateList = [
      'Сегодня, ${widget.dateTime.day} cентября',
      'Завтра, ${nextDay} cентября'
    ];
    return SizedBox(
      width: 335,
      height: 48,
      child: Material(
        child: ValueListenableBuilder(
            valueListenable: widget.model.dropValue,
            builder: (BuildContext context, String value, _) {
              return DropdownButtonFormField(
                decoration: InputDecoration(
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15.0),
                  fillColor: colorrs.greyy,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Colors.transparent, width: 0)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Colors.transparent, width: 0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Colors.transparent, width: 0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Colors.transparent, width: 0)),
                ),
                isExpanded: true,
                hint: Text(
                  'Сегодня, ${widget.dateTime.day} cентября',
                  style: TexxtStyle.blackSubTitle,
                ),
                icon: const ImageIcon(AssetImage("assets/dropDownIcon.png")),
                value: (value.isEmpty) ? null : value,
                onChanged: (choice) {
                  widget.model.dropValue.value = choice.toString();
                  choice.toString() ==
                          'Сегодня, ${widget.dateTime.day} cентября'
                      ? widget.model.dob = DateTime(widget.model.dob.year,
                          widget.model.dob.month, widget.dateTime.day)
                      : widget.model.dob = DateTime(widget.model.dob.year,
                          widget.model.dob.month, nextDay);
                  widget.model.setDayValide();
                  print(widget.model.dob);
                },
                items: dateList
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
              );
            }),
      ),
    );
  }
}

List<String> listTime = [
  "10:00",
  "13:00",
  "14:00",
  "15:00",
  "16:00",
  "18:00",
  "19:00"
];

class listTimes extends StatefulWidget {
  patienceOrderModel model;
  listTimes({super.key, required this.model});

  @override
  State<listTimes> createState() => _listTimesState();
}

class _listTimesState extends State<listTimes> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: listTime.length,
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(left: 16),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.model.index = index;
                  });
                  widget.model.dob = DateTime(
                      widget.model.dob.year,
                      widget.model.dob.month,
                      widget.model.dob.day,
                      int.parse(listTime[index].substring(0, 2)));
                  widget.model.setTimeValide();
                  print(widget.model.dob);
                },
                child: Container(
                  width: 70,
                  height: 40,
                  decoration: BoxDecoration(
                      color: widget.model.index == index
                          ? colorrs.accent
                          : colorrs.greyy,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      listTime[index],
                      style: widget.model.index == index
                          ? TexxtStyle.bankTxtStyleWhite
                          : TexxtStyle.bankTxtStyle,
                    ),
                  ),
                ),
              ),
            ));
  }
}

class ConfirmButton extends StatelessWidget {
  patienceOrderModel model;
  ConfirmButton({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      height: 56,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(model.addressValide &&
                    model.entranceValide &&
                    model.flatValide &&
                    model.floorValide &&
                    model.heightValide &&
                    model.intercomValide &&
                    model.longitudeValide &&
                    model.widthValide
                ? colorrs.accent
                : colorrs.inactiveAccent),
            elevation: const MaterialStatePropertyAll(0),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
        onPressed: () {
          model.saveVal
              ? model.saveAddress(model.adress)
              : model.clearAddress();
          Navigator.of(context).pop();
        },
        child: Text(
          "Подтвердить",
          style: TexxtStyle.buttonStyleWhite,
        ),
      ),
    );
  }
}

class confirmButton extends StatelessWidget {
  patienceOrderModel model;
  int index;
  confirmButton({super.key, required this.index, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      height: 56,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
                index == -1 ? colorrs.inactiveAccent : colorrs.accent),
            elevation: const MaterialStatePropertyAll(0),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(10)))),
        onPressed: () => index == -1
            ? null
            : {model.addUser(listPerson[index]), Navigator.pop(context)},
        child: Text(
          "Подтвердить",
          style: TexxtStyle.buttonStyleWhite,
        ),
      ),
    );
  }
}

class PatientsList extends StatelessWidget {
  patienceOrderModel model;
  PatientsList({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: model.personList.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(top: 16),
        child: patientEl(
          model: model,
          index: index,
        ),
      ),
    );
  }
}

class patientEl extends StatelessWidget {
  int index;
  patienceOrderModel model;
  patientEl({super.key, required this.model, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: colorrs.greyy, borderRadius: BorderRadius.circular(10)),
      child: Row(children: [
        SizedBox(
          width: 40,
          height: 48,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                color: colorrs.greyy),
            child: model.personList[index].gender == 0
                ? Image.asset("assets/user_icon.png")
                : Image.asset("assets/girlUser.png"),
          ),
        ),
        Text(
            "${model.personList[index].surname} ${model.personList[index].name}")
      ]),
    );
  }
}

class listAnalyses extends StatelessWidget {
  patienceOrderModel model;
  List<analyse> listAnalyse = [];
  listAnalyses({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < model.analyseList.length; i++) {
      listAnalyse.add(model.analyseList[i]);
    }
    var list = listAnalyse.toSet().toList();
    return ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: itemAnalyses(
              listAnalyse: list,
              index: index,
            )));
  }
}

class itemAnalyses extends StatefulWidget {
  int index;
  List<analyse> listAnalyse;
  itemAnalyses({super.key, required this.index, required this.listAnalyse});

  @override
  State<itemAnalyses> createState() => _itemAnalysesState();
}

class _itemAnalysesState extends State<itemAnalyses> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 303,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: SizedBox(
              width: 20,
              height: 20,
              child: Material(
                child: Checkbox(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    activeColor: colorrs.accent,
                    checkColor: Colors.white,
                    value: isChecked,
                    onChanged: (val) {
                      setState(() {
                        isChecked = val!;
                      });
                    }),
              ),
            ),
          ),
          Expanded(
            child: Text(
              "${widget.listAnalyse[widget.index].title}",
              softWrap: true,
              style: TexxtStyle.subAnalyseText,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Text(
              "${widget.listAnalyse[widget.index].price} ₽",
              style: TexxtStyle.blackSubTitle,
            ),
          ),
        ],
      ),
    );
  }
}
