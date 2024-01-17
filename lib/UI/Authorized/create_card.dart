import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medic/style/texxt_style.dart';
import 'package:medic/style/colorrs.dart';
import 'package:provider/provider.dart';
import '../../Domain/models/create_card_model.dart';

class CreateCard extends StatelessWidget {
  CreateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          child: Provider(
              create: (BuildContext context) => createCardModel(),
              child: const subCreateCardWidget())),
    );
  }
}

class subCreateCardWidget extends StatefulWidget {
  const subCreateCardWidget({super.key});

  @override
  State<subCreateCardWidget> createState() => _subCreateCardWidgetState();
}

class _subCreateCardWidgetState extends State<subCreateCardWidget> {
  List<String> sexList = ["Мужской", "Женский"];
  final dropValue = ValueNotifier('');
  bool nameValide = false;
  bool surnameValide = false;
  bool patronymicValide = false;
  bool dobValide = false;
  bool genderValide = false;
  @override
  Widget build(BuildContext context) {
    final model = context.watch<createCardModel>();
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 32.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 240.w,
                  child: Text(
                    "Создание карты пациента",
                    style: TexxtStyle.title,
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: GestureDetector(
                    onTap: () => model.goToMainScreen(context),
                    child: Text(
                      "Пропустить",
                      style: TexxtStyle.sfRegMain,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "Без карты пациента вы не сможете заказать анализы.",
              style: TexxtStyle.subSubTitle,
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "В картах пациента будут храниться результаты анализов вас и ваших близких.",
              style: TexxtStyle.subSubTitle,
            ),
            SizedBox(
              height: 32.h,
            ),
            Center(
              child: SizedBox(
                width: 335.w,
                height: 48.h,
                child: CupertinoTextField(
                  keyboardType: TextInputType.name,
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  onChanged: (value) {
                    model.name = value;
                    setState(() {
                      model.name.isNotEmpty
                          ? nameValide = true
                          : nameValide = false;
                    });
                  },
                  placeholder: "Имя",
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                  placeholderStyle: TexxtStyle.placeHolderSTyle,
                  decoration: const BoxDecoration(
                    color: colorrs.greyy,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Center(
              child: SizedBox(
                width: 335.w,
                height: 48.h,
                child: CupertinoTextField(
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  onChanged: (value) {
                    model.patronymic = value;
                    setState(() {
                      model.patronymic.isNotEmpty
                          ? patronymicValide = true
                          : patronymicValide = false;
                    });
                  },
                  keyboardType: TextInputType.name,
                  placeholder: "Отчество",
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                  placeholderStyle: TexxtStyle.placeHolderSTyle,
                  decoration: const BoxDecoration(
                    color: colorrs.greyy,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Center(
              child: SizedBox(
                width: 335.w,
                height: 48.h,
                child: CupertinoTextField(
                  keyboardType: TextInputType.name,
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  onChanged: (value) {
                    model.surname = value;
                    setState(() {
                      model.surname.isNotEmpty
                          ? surnameValide = true
                          : surnameValide = false;
                    });
                  },
                  placeholder: "Фамилия",
                  placeholderStyle: TexxtStyle.placeHolderSTyle,
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                  decoration: const BoxDecoration(
                    color: colorrs.greyy,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Center(
                child: SizedBox(
              width: 335.w,
              height: 48.h,
              child: CupertinoTextField(
                keyboardType: TextInputType.number,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                onChanged: (value) {
                  model.dob = value;
                  setState(() {
                    model.dob.isNotEmpty ? dobValide = true : dobValide = false;
                  });
                },
                placeholder: "Дата рождения",
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                placeholderStyle: TexxtStyle.placeHolderSTyle,
                decoration: const BoxDecoration(
                  color: colorrs.greyy,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            )),
            SizedBox(
              height: 24.h,
            ),
            Center(
                child: SizedBox(
              width: 335.w,
              height: 48.h,
              child: Material(
                child: ValueListenableBuilder(
                    valueListenable: dropValue,
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
                        hint: Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: Text(
                            'Пол',
                            style: TexxtStyle.placeHolderSTyle,
                          ),
                        ),
                        icon: SvgPicture.asset('assets/dropDown.svg'),
                        value: (value.isEmpty) ? null : value,
                        onChanged: (choice) {
                          dropValue.value = choice.toString();
                          choice == "Мужской"
                              ? model.gender = 0
                              : model.gender = 1;
                          setState(() {
                            dropValue.value != ''
                                ? genderValide = true
                                : genderValide = false;
                          });
                        },
                        items: sexList
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                      );
                    }),
              ),
            )),
            SizedBox(
              height: 48.h,
            ),
            Center(
              child: SizedBox(
                  width: 335.w,
                  height: 56.h,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: const MaterialStatePropertyAll(0),
                        backgroundColor: MaterialStatePropertyAll(nameValide &&
                                surnameValide &&
                                patronymicValide &&
                                dobValide &&
                                genderValide
                            ? colorrs.accent
                            : colorrs.inactiveAccent),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: () => nameValide &&
                            surnameValide &&
                            patronymicValide &&
                            dobValide &&
                            genderValide
                        ? model.createCardUser(
                            context,
                            model.name,
                            model.surname,
                            model.patronymic,
                            model.dob,
                            model.gender)
                        : null,
                    child: Text(
                      "Создать",
                      style: TexxtStyle.buttonStyleWhite,
                    ),
                  )),
            ),
            SizedBox(
              height: 150.h,
            )
          ],
        ),
      ),
    );
  }
}
