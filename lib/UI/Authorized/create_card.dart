import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          resizeToAvoidBottomInset: false,
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
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 84),
              child: Column(
                children: [
                  Text(
                    "Создание карты",
                    style: TexxtStyle.title,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 80),
                    child: Text(
                      "пациента",
                      style: TexxtStyle.title,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 70),
              child: TextButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                  Colors.transparent,
                )),
                child: Text(
                  "Пропустить",
                  style: TexxtStyle.followingTxtStyle,
                ),
                onPressed: () => model.goToMainScreen(context),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, right: 15),
          child: Text(
            "Без карты пациента вы не сможете заказать анализы.",
            style: TexxtStyle.subSubTitle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 57, top: 15),
          child: Text(
            "В картах пациента будут храниться результаты",
            style: TexxtStyle.subSubTitle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 157, top: 5),
          child: Text(
            "анализов вас и ваших близких.",
            style: TexxtStyle.subSubTitle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 35),
          child: SizedBox(
            width: 335,
            height: 48,
            child: CupertinoTextField(
              autofocus: true,
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
              placeholderStyle: TexxtStyle.placeHolderSTyle,
              decoration: const BoxDecoration(
                color: colorrs.greyy,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15),
          child: SizedBox(
            width: 335,
            height: 48,
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
              placeholderStyle: TexxtStyle.placeHolderSTyle,
              decoration: const BoxDecoration(
                color: colorrs.greyy,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: SizedBox(
            width: 335,
            height: 48,
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
              decoration: const BoxDecoration(
                color: colorrs.greyy,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 15),
            child: SizedBox(
              width: 335,
              height: 48,
              child: CupertinoTextField(
                keyboardType: TextInputType.text,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                onChanged: (value) {
                  model.dob = value;
                  setState(() {
                    model.dob.isNotEmpty ? dobValide = true : dobValide = false;
                  });
                },
                placeholder: "Дата рождения",
                placeholderStyle: TexxtStyle.placeHolderSTyle,
                decoration: const BoxDecoration(
                  color: colorrs.greyy,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            )),
        Padding(
            padding: EdgeInsets.only(top: 15),
            child: SizedBox(
              width: 335,
              height: 48,
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
                        hint: Text(
                          'Пол',
                          style: TexxtStyle.placeHolderSTyle,
                        ),
                        icon: const ImageIcon(
                            AssetImage("assets/dropDownIcon.png")),
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
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: SizedBox(
              width: 335,
              height: 56,
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
                    ? model.createCardUser(context, model.name, model.surname,
                        model.patronymic, model.dob, model.gender)
                    : null,
                child: Text(
                  "Создать",
                  style: TexxtStyle.buttonStyleWhite,
                ),
              )),
        ),
      ],
    );
  }
}
