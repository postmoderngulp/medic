import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medic/style/colorrs.dart';
import 'package:medic/style/texxt_style.dart';
import 'package:provider/provider.dart';
import '../../Domain/models/userModel.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
        create: (BuildContext context) => userModel(),
        child: const subUserWidget());
  }
}

class subUserWidget extends StatefulWidget {
  const subUserWidget({super.key});

  @override
  State<subUserWidget> createState() => _subUserWidgetState();
}

class _subUserWidgetState extends State<subUserWidget> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<userModel>();
    List<String> sexList = ["Мужской", "Женский"];
    final dropValue = ValueNotifier('');
    return SafeArea(
      child: CupertinoPageScaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 17.h,
                  ),
                  Center(
                      child: Text(
                    "Карта пациента",
                    style: TexxtStyle.title,
                  )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        model.pickImage();
                      },
                      child: avatar(
                        model: model,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Без карты пациента вы не сможете заказать анализы",
                    style: TexxtStyle.SubsubSubTitle,
                    softWrap: true,
                  ),
                  Text(
                    "В картах пациентов будут храниться результаты",
                    style: TexxtStyle.SubsubSubTitle,
                    softWrap: true,
                  ),
                  Text(
                    "анализов вас и ваших близких.",
                    style: TexxtStyle.SubsubSubTitle,
                    softWrap: true,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                      width: 335.w,
                      height: 48.h,
                      child: CupertinoTextField(
                        keyboardType: TextInputType.name,
                        onEditingComplete: () =>
                            FocusScope.of(context).nextFocus(),
                        onChanged: (value) {
                          model.name = value;
                          model.setNameValide();
                        },
                        placeholder: 'Имя',
                        padding: const EdgeInsets.all(14),
                        placeholderStyle: TexxtStyle.placeHolderSTyle,
                        decoration: const BoxDecoration(
                          color: colorrs.greyy,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      )),
                  SizedBox(
                    height: 24.h,
                  ),
                  SizedBox(
                      width: 335.w,
                      height: 48.h,
                      child: CupertinoTextField(
                        keyboardType: TextInputType.name,
                        onEditingComplete: () =>
                            FocusScope.of(context).nextFocus(),
                        onChanged: (value) {
                          model.patronymic = value;
                          model.setPatronymicValide();
                        },
                        padding: const EdgeInsets.all(14),
                        placeholder: 'Отчество',
                        placeholderStyle: TexxtStyle.placeHolderSTyle,
                        decoration: const BoxDecoration(
                          color: colorrs.greyy,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      )),
                  SizedBox(
                    height: 24.h,
                  ),
                  SizedBox(
                      width: 335.w,
                      height: 48.h,
                      child: CupertinoTextField(
                        keyboardType: TextInputType.name,
                        onEditingComplete: () =>
                            FocusScope.of(context).nextFocus(),
                        onChanged: (value) {
                          model.surname = value;
                          model.setSurnameValide();
                        },
                        padding: const EdgeInsets.all(14),
                        placeholder: 'Фамилия',
                        placeholderStyle: TexxtStyle.placeHolderSTyle,
                        decoration: const BoxDecoration(
                          color: colorrs.greyy,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      )),
                  SizedBox(
                    height: 24.h,
                  ),
                  SizedBox(
                      width: 335.w,
                      height: 48.h,
                      child: CupertinoTextField(
                        keyboardType: TextInputType.text,
                        onEditingComplete: () =>
                            FocusScope.of(context).nextFocus(),
                        placeholder: "Дата рождения",
                        onChanged: (value) {
                          model.dob = value;
                          model.setDobValide();
                        },
                        padding: const EdgeInsets.all(14),
                        placeholderStyle: TexxtStyle.placeHolderSTyle,
                        decoration: const BoxDecoration(
                          color: colorrs.greyy,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      )),
                  SizedBox(
                    height: 24.h,
                  ),
                  SizedBox(
                    width: 335.w,
                    height: 50.h,
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  'Пол',
                                  style: TexxtStyle.placeHolderSTyle,
                                ),
                              ),
                              icon: const ImageIcon(
                                  AssetImage("assets/dropDownIcon.png")),
                              value: (value.isEmpty) ? null : value,
                              onChanged: (choice) {
                                dropValue.value = choice.toString();
                                choice == 'Мужской'
                                    ? model.gender = 0
                                    : model.gender = 1;
                                model.setGenderValide();
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
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  SizedBox(
                      width: 335.w,
                      height: 56.h,
                      child: saveCardButton(
                        nameValide: model.nameValide,
                        surnameValide: model.surnameValide,
                        patronymicValide: model.patronymicValide,
                        dobValide: model.dobValide,
                        genderValide: model.genderValide,
                      )),
                  SizedBox(
                    height: 13.h,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class avatar extends StatefulWidget {
  userModel model;
  avatar({super.key, required this.model});

  @override
  State<avatar> createState() => _avatarState();
}

class _avatarState extends State<avatar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<userModel>();
    return Container(
        width: 148.w,
        height: 123.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            image: model.avatar == null || model.avatar?.path == "null"
                ? const DecorationImage(
                    image: AssetImage("assets/defolt_avatar.png"),
                    fit: BoxFit.cover)
                : DecorationImage(
                    image: FileImage(model.avatar!), fit: BoxFit.cover)));
  }
}

class saveCardButton extends StatelessWidget {
  bool nameValide;
  bool surnameValide;
  bool patronymicValide;
  bool dobValide;
  bool genderValide;
  saveCardButton(
      {super.key,
      required this.nameValide,
      required this.surnameValide,
      required this.patronymicValide,
      required this.dobValide,
      required this.genderValide});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<userModel>();
    return ElevatedButton(
      style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(0),
          backgroundColor: MaterialStatePropertyAll(model.avatarValide ||
                  (nameValide &&
                      surnameValide &&
                      patronymicValide &&
                      dobValide &&
                      genderValide)
              ? colorrs.accent
              : colorrs.inactiveAccent),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
      onPressed: () => model.avatarValide
          ? model.loadAvatar(model.avatar)
          : (dobValide &&
                  surnameValide &&
                  patronymicValide &&
                  dobValide &&
                  genderValide)
              ? model.putUser(model.name, model.surname, model.patronymic,
                  model.dob, model.gender)
              : null,
      child: Text(
        "Сохранить",
        style: TexxtStyle.buttonStyleWhite,
      ),
    );
  }
}
