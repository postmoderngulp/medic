import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medic/Domain/entity/analyse.dart';
import 'package:medic/Domain/models/date_time_banner.dart';
import 'package:medic/style/colorrs.dart';
import 'package:medic/style/texxt_style.dart';
import '../../Domain/entity/person.dart';
import '../../Domain/models/address_banner_model.dart';
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16.h,
            ),
            const BackButton(),
            SizedBox(
              height: 24.h,
            ),
            Text(
              "Оформление заказа",
              style: TexxtStyle.title,
            ),
            SizedBox(
              height: 32.h,
            ),
            Text(
              "Адрес *",
              style: TexxtStyle.subSubTitle,
            ),
            const ChooseAdressInputField(),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "Дата и время*",
              style: TexxtStyle.subSubTitle,
            ),
            ChooseDateAndTimeInputField(),
            SizedBox(
              height: 32.h,
            ),
            Row(
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
            SizedBox(
              height: 16.h,
            ),
            listPatient(
              model: model,
            ),
            SizedBox(
              height: 16.h,
            ),
            addPatientButton(
              model: model,
            ),
            SizedBox(
              height: 32.h,
            ),
            Text(
              "Телефон *",
              style: TexxtStyle.subSubTitle,
            ),
            const numberPhoneInputField(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Комментарий",
                  style: TexxtStyle.subSubTitle,
                ),
                CupertinoButton(
                    child: ImageIcon(
                      AssetImage("assets/male.png"),
                      color: Colors.black,
                      size: 24.w,
                    ),
                    onPressed: () {})
              ],
            ),
            const stayWishField(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Оплата Apple Pay",
                  style: TexxtStyle.textMedium,
                ),
                CupertinoButton(
                  onPressed: () {},
                  child: ImageIcon(
                    const AssetImage("assets/rightIcon.png"),
                    color: colorrs.someGreyy,
                    size: 20.w,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Промокод",
                  style: TexxtStyle.promoText,
                ),
                CupertinoButton(
                  onPressed: () {},
                  child: ImageIcon(
                    const AssetImage("assets/rightIcon.png"),
                    color: colorrs.someGreyy,
                    size: 20.w,
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 32.h),
              child: SizedBox(
                width: 335.w,
                height: 56.h,
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
      width: 335.w,
      height: 48.h,
      child: GestureDetector(
        onTap: () => showModalBottomSheet<dynamic>(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return ChangeNotifierProvider(
              create: (context)=> addressBannerModel(),
              child: adressBanner(
                Model: model,
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
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: model.adress.address.isNotEmpty
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
  @override
  Widget build(BuildContext context) {
    final model = context.watch<patienceOrderModel>();
    return SizedBox(
      width: 335.w,
      height: 48.h,
      child: GestureDetector(
        onTap: () => showModalBottomSheet<dynamic>(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return ChangeNotifierProvider(create: (context) => dateTimeBannerModel(),
            child: dateTimeBanner(),
            );
          },
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: colorrs.greyy,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 14.w),
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

class dateTimeBanner extends StatelessWidget {
   dateTimeBanner({super.key});
  int val = -1;
  @override
  Widget build(BuildContext context) {
    final model = context.watch<dateTimeBannerModel>();
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24))),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Дата и время",
                  style: TexxtStyle.title2Text,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Выберите дату",
              style: TexxtStyle.subSubTitle,
            ),
          const dropFieldDate(),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5.h),
              child: Text(
                "Выберите время",
                style: TexxtStyle.subSubTitle,
              ),
            ),
            const listViewTime(),
            const confirmDateButton(),
          ],
        ),
      ),
    );
  }
}

class confirmDateButton extends StatelessWidget {
  const confirmDateButton({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<dateTimeBannerModel>();
    return Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: 24.h, top: 20.h),
        child: SizedBox(
          width: 335.w,
          height: 56.h,
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
                ?
              Navigator.of(context).pop()
            : null,
            child: Text(
              "Подтвердить",
              style: TexxtStyle.buttonStyleWhite,
            ),
          ),
        ),
      ),
    );
  }
}


class listViewTime extends StatelessWidget {
  const listViewTime({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<dateTimeBannerModel>();
    return  SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 40.h,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: listTime.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: GestureDetector(
              onTap: () {
                model.setIndex(index);
                model.dob = DateTime(
                    model.dob.year,
                    model.dob.month,
                    model.dob.day,
                    int.parse(
                        listTime[index].substring(0, 2)));
                model.setTimeValide();
                print(model.dob);

              },
              child: Container(
                width: 70.w,
                height: 40.h,
                decoration: BoxDecoration(
                    color: model.index == index
                        ? colorrs.accent
                        : colorrs.greyy,
                    borderRadius:
                    BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    listTime[index],
                    style: model.index == index
                        ? TexxtStyle.bankTxtStyleWhite
                        : TexxtStyle.bankTxtStyle,
                  ),
                ),
              ),
            ),
          )),
    );
  }
}


class dropFieldDate extends StatelessWidget {
  const dropFieldDate({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    var nextDay = dateTime.day + 1;
    List<String> dateList = [
      'Сегодня, ${dateTime.day} cентября',
      'Завтра, ${nextDay} cентября'
    ];
    final model = context.watch<dateTimeBannerModel>();
    return  Center(
        child: SizedBox(
          width: 335.w,
          height: 56.h,
          child: Material(
            child: ValueListenableBuilder(
                valueListenable: model.dropValue,
                builder: (BuildContext context, String value, _) {
                  return DropdownButtonFormField(
                    decoration: InputDecoration(
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 10.0.w, vertical: 15.0.h),
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
                      'Сегодня, ${dateTime.day} cентября',
                      style: TexxtStyle.blackSubTitle,
                    ),
                    icon: const ImageIcon(
                        AssetImage("assets/dropDownIcon.png")),
                    value: (value.isEmpty) ? null : value,
                    onChanged: (choice) {
                      model.dropValue.value = choice.toString();
                      choice.toString() ==
                          'Сегодня, ${dateTime.day} cентября'
                          ? model.dob = DateTime(model.dob.year,
                          model.dob.month, dateTime.day)
                          : model.dob = DateTime(model.dob.year,
                          model.dob.month, nextDay);
                      model.setDayValide();
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
        ));
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
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: SizedBox(
          width: 335.w,
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
                    width: 40.w,
                    height: 48.h,
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
                      width: 260.w,
                      decoration: const BoxDecoration(color: colorrs.greyy),
                      child: Text(
                          "${widget.model.personList[widget.index].surname} ${widget.model.personList[widget.index].name}")),
                  Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: colorrs.greyy),
                      child: ImageIcon(
                          const AssetImage("assets/dropDownIcon.png"),
                          color: colorrs.iCGreyy,
                          size: 20.w)),
                ],
              ),
            ),
          )
        : Container(
            width: 335.w,
            decoration: BoxDecoration(
                border: Border.all(color: colorrs.greyy, width: 1),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => setState(() {
                          el = !el;
                        }),
                        child: SizedBox(
                          width: 267.w,
                          height: 48.h,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: colorrs.greyy,
                                borderRadius: BorderRadiusDirectional.all(
                                    Radius.circular(10))),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 40.w,
                                  height: 48.h,
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
                                    width: 190.w,
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
                                    child: ImageIcon(
                                      const AssetImage(
                                          "assets/dropDownIcon.png"),
                                      color: colorrs.iCGreyy,
                                      size: 20.w,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.w),
                        child: GestureDetector(
                          onTap: () => widget.model.delUser(widget.index),
                          child: ImageIcon(
                            const AssetImage("assets/removePatient.png"),
                            color: colorrs.greyy,
                            size: 16.w,
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
      width: 335.w,
      height: 48.h,
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
      width: 335.w,
      height: 48.h,
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
      width: 335.w,
      height: 48.h,
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
      width: 335.w,
      height: 128.h,
      child: CupertinoTextField(
        onChanged: (value) {
          model.comment = value;
          model.setCommentValide();
        },
        padding: EdgeInsets.only(left: 14.w, top: 14.h),
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
  patienceOrderModel Model;
  adressBanner({super.key,required this.Model});

  @override
  State<adressBanner> createState() => _adressBannerState();
}

class _adressBannerState extends State<adressBanner> {
  
  @override
  void dispose() {

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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 24.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Адрес сдачи анализов",
                      style: TexxtStyle.title2Text,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Image.asset("assets/mapImage.png"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ваш адрес",
                    style: TexxtStyle.subSubTitle,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Center(child: addressInputField()),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.h),
                        child: Text(
                          "Долгота",
                          style: TexxtStyle.subSubTitle,
                        ),
                      ),
                      Center(
                        child: longitudeInputField(

                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 5.h,
                          ),
                          child: Text(
                            "Широта",
                            style: TexxtStyle.subSubTitle,
                          ),
                        ),
                        Center(
                          child: latitudeInputField(

                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.h),
                          child: Text(
                            "Высота",
                            style: TexxtStyle.subSubTitle,
                          ),
                        ),
                        Center(
                          child: heightInputField(

                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.h),
                          child: Text(
                            "Квартира",
                            style: TexxtStyle.subSubTitle,
                          ),
                        ),
                        Center(
                          child: flatInputField(
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 5.h,
                            ),
                            child: Text(
                              "Подъезд",
                              style: TexxtStyle.subSubTitle,
                            ),
                          ),
                          Center(
                            child: entranceInputField(

                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 18.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 5.h),
                            child: Text(
                              "Этаж",
                              style: TexxtStyle.subSubTitle,
                            ),
                          ),
                          Center(
                            child: floorInputField(

                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5.h, top: 10.h),
                child: Text(
                  "Домофон",
                  style: TexxtStyle.subSubTitle,
                ),
              ),
              Center(
                child: domofonInputField(

                ),
              ),
              saveAddress(

              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 10.h, bottom: 24.h),
                  child: ConfirmButton(Model: widget.Model,),
                ),
              ),
            ]),
      ),
    );
  }
}

class saveAddress extends StatefulWidget {
  saveAddress({super.key,  });

  @override
  State<saveAddress> createState() => _saveAddressState();
}

class _saveAddressState extends State<saveAddress> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<addressBannerModel>();
    return Padding(
      padding: EdgeInsets.only(left: 30.w, top: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Сохранить этот адрес?",
            style: TexxtStyle.HeadlineMedium,
          ),
          CupertinoSwitch(
              value: model.saveVal,
              activeColor: colorrs.accent,
              onChanged: (value) {
                  model.setSaveValide(value);
              }),
        ],
      ),
    );
  }
}

class addressInputField extends StatelessWidget {
  addressInputField({super.key,  });

  @override
  Widget build(BuildContext context) {
    final model = context.watch<addressBannerModel>();
    return SizedBox(
      width: 335.w,
      height: 72.h,
      child: CupertinoTextField(
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        onChanged: (value) {
          model.address = value;
          model.setAdresValide();
        },
        placeholder:
            model.address.isNotEmpty ? model.address : "Перекопская 22к1",
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
  domofonInputField({super.key,  });

  @override
  Widget build(BuildContext context) {
    final model = context.watch<addressBannerModel>();
    return SizedBox(
      width: 335.w,
      height: 72.h,
      child: CupertinoTextField(
        keyboardType: TextInputType.number,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        onChanged: (value) {
          model.intercom = value;
          model.setIntercomValide();
        },
        placeholder: model.intercom.isNotEmpty ? model.intercom : "188*2180",
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
  longitudeInputField({super.key,});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<addressBannerModel>();
    return SizedBox(
      width: 130.w,
      height: 72.h,
      child: CupertinoTextField(
        keyboardType: TextInputType.number,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        onChanged: (value) {
          model.longitude = int.parse(value);
          model.setLongitudeValide();
        },
        placeholder:
        model.longitude != 0 ? "${model.longitude}" : "188",
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
  latitudeInputField({super.key,  });

  @override
  Widget build(BuildContext context) {
    final model = context.watch<addressBannerModel>();
    return SizedBox(
      width: 130.w,
      height: 72.h,
      child: CupertinoTextField(
        keyboardType: TextInputType.number,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        onChanged: (value) {
          model.width = int.parse(value);
          model.setWidthValide();
        },
        placeholder: model.width != 0  ? "${model.width}" : "4",
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

  heightInputField({super.key,  });

  @override
  Widget build(BuildContext context) {
    final model = context.watch<addressBannerModel>();
    return SizedBox(
      width: 50.w,
      height: 72.h,
      child: CupertinoTextField(
        keyboardType: TextInputType.number,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        onChanged: (value) {
          model.height = int.parse(value);
          model.setHeightValide();
        },
        placeholder: model.height != 0  ? "${model.height}" : "8",
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

  flatInputField({super.key,  });

  @override
  Widget build(BuildContext context) {
    final model = context.watch<addressBannerModel>();
    return SizedBox(
      width: 100.w,
      height: 72.h,
      child: CupertinoTextField(
        keyboardType: TextInputType.number,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        onChanged: (value) {
          model.flat = int.parse(value);
          model.setFlatValide();
        },
        placeholder: model.flat != 0 ? "${model.flat}" : "188",
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

  entranceInputField({super.key, });

  @override
  Widget build(BuildContext context) {
    final model = context.watch<addressBannerModel>();
    return SizedBox(
      width: 100.w,
      height: 72.h,
      child: CupertinoTextField(
        keyboardType: TextInputType.number,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        onChanged: (value) {
          model.entrance = int.parse(value);
          model.setEntranceValide();
        },
        placeholder: model.entrance != 0 ? "${model.entrance}" : "8",
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

  floorInputField({super.key,});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<addressBannerModel>();
    return SizedBox(
      width: 100.w,
      height: 72.h,
      child: CupertinoTextField(
        keyboardType: TextInputType.number,
        onEditingComplete: () => FocusScope.of(context).unfocus(),
        onChanged: (value) {
          model.floor = int.parse(value);
          model.setFloorValide();
        },
        placeholder: model.floor != 0 ? "${model.floor}" : "8",
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
      birthday: DateTime.now().toString(),
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
            padding: EdgeInsets.only(top: 24.h, left: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Выбор пациента",
                  style: TexxtStyle.title2Text,
                ),

              ],
            ),
          ),
          SizedBox(
            width: 335.w,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: listPerson.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(top: 16.h),
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
                        width: 40.w,
                        height: 48.h,
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
            padding: EdgeInsets.only(top: 20.h),
            child: addPatButton(
              model: widget.model,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.h, bottom: 15.h),
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

List<String> listTime = [
  "10:00",
  "13:00",
  "14:00",
  "15:00",
  "16:00",
  "18:00",
  "19:00"
];

class ConfirmButton extends StatelessWidget {
  patienceOrderModel Model;
  ConfirmButton({super.key,required this.Model});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<addressBannerModel>();
    return SizedBox(
      width: 335.w,
      height: 56.h,
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
        onPressed: ()  async{
          model.saveVal
              ?
          await model.saveAddress(model.address,model.longitude,model.width,model.height,model.flat,model.entrance,model.floor,model.intercom)
              : await model.clearAddress();
          Navigator.of(context).pop();
       await  Model.getAddress();
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
      width: 335.w,
      height: 56.h,
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
        padding: EdgeInsets.symmetric(vertical: 16.h),
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
          width: 40.w,
          height: 48.h,
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
            padding: EdgeInsets.symmetric(horizontal: 24.w),
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
    return Padding(
      padding:  EdgeInsets.only(bottom: 10.h),
      child: SizedBox(
        width: 303.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(
                width: 20.w,
                height: 20.h,
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
            SizedBox(width: 5.w,),
            Expanded(
              child: Text(
                "${widget.listAnalyse[widget.index].title}",
                softWrap: true,
                style: TexxtStyle.subAnalyseText,
              ),
            ),
             Text(
                "${widget.listAnalyse[widget.index].price} ₽",
                style: TexxtStyle.blackSubTitle,

            ),
          ],
        ),
      ),
    );
  }
}
