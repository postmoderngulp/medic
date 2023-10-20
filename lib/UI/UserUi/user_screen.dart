import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medic/style/colorrs.dart';
import 'package:medic/style/texxt_style.dart';
import 'package:image_picker/image_picker.dart';
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
  File? iimage;
  final imagePicker = ImagePicker();
  Future getImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      iimage = File("${image?.path}");
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<userModel>();
    List<String> sexList = ["Мужской", "Женский"];
    final dropValue = ValueNotifier('');
    return SafeArea(
      child: SingleChildScrollView(
        child: CupertinoPageScaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 61),
                  child: Center(
                      child: Text(
                    "Карта пациента",
                    style: TexxtStyle.title,
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    onTap: () => getImage(),
                    child: avatar(
                      model: model,
                      image: iimage,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, right: 40),
                  child: Text(
                    "Без карты пациента вы не сможете заказать анализы",
                    style: TexxtStyle.SubsubSubTitle,
                    softWrap: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, right: 70),
                  child: Text(
                    "В картах пациентов будут храниться результаты",
                    style: TexxtStyle.SubsubSubTitle,
                    softWrap: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, right: 170),
                  child: Text(
                    "анализов вас и ваших близких.",
                    style: TexxtStyle.SubsubSubTitle,
                    softWrap: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: SizedBox(
                      width: 335,
                      height: 48,
                      child: CupertinoTextField(
                        keyboardType: TextInputType.name,
                        onEditingComplete: () =>
                            FocusScope.of(context).nextFocus(),
                        onChanged: (value) {
                          model.name = value;
                          model.setNameValide();
                        },
                        placeholder: 'Имя',
                        placeholderStyle: TexxtStyle.placeHolderSTyle,
                        decoration: const BoxDecoration(
                          color: colorrs.greyy,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: SizedBox(
                      width: 335,
                      height: 48,
                      child: CupertinoTextField(
                        keyboardType: TextInputType.name,
                        onEditingComplete: () =>
                            FocusScope.of(context).nextFocus(),
                        onChanged: (value) {
                          model.patronymic = value;
                          model.setPatronymicValide();
                        },
                        placeholder: 'Отчество',
                        placeholderStyle: TexxtStyle.placeHolderSTyle,
                        decoration: const BoxDecoration(
                          color: colorrs.greyy,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: SizedBox(
                      width: 335,
                      height: 48,
                      child: CupertinoTextField(
                        keyboardType: TextInputType.name,
                        onEditingComplete: () =>
                            FocusScope.of(context).nextFocus(),
                        onChanged: (value) {
                          model.surname = value;
                          model.setSurnameValide();
                        },
                        placeholder: 'Фамилия',
                        placeholderStyle: TexxtStyle.placeHolderSTyle,
                        decoration: const BoxDecoration(
                          color: colorrs.greyy,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: SizedBox(
                      width: 335,
                      height: 48,
                      child: CupertinoTextField(
                        keyboardType: TextInputType.text,
                        onEditingComplete: () =>
                            FocusScope.of(context).nextFocus(),
                        placeholder: "Дата рождения",
                        onChanged: (value) {
                          model.dob = value;
                          model.setDobValide();
                        },
                        placeholderStyle: TexxtStyle.placeHolderSTyle,
                        decoration: const BoxDecoration(
                          color: colorrs.greyy,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: SizedBox(
                      width: 335,
                      height: 48,
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
                                            color: Colors.transparent,
                                            width: 0)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0)),
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
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 22, bottom: 15),
                  child: SizedBox(
                      width: 335,
                      height: 56,
                      child: saveCardButton(
                        nameValide: model.nameValide,
                        surnameValide: model.surnameValide,
                        patronymicValide: model.patronymicValide,
                        dobValide: model.dobValide,
                        genderValide: model.genderValide,
                      )),
                )
              ],
            )),
      ),
    );
  }
}

class avatar extends StatefulWidget {
  userModel model;
  File? image;
  avatar({super.key, required this.image, required this.model});

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
    return Container(
        width: 148,
        height: 123,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            image: widget.image == null || widget.image?.path == "null"
                ? const DecorationImage(
                    image: AssetImage("assets/defolt_avatar.png"),
                    fit: BoxFit.cover)
                : DecorationImage(
                    image: FileImage(widget.image!), fit: BoxFit.cover)));
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
          backgroundColor: MaterialStatePropertyAll(nameValide &&
                  surnameValide &&
                  patronymicValide &&
                  dobValide &&
                  genderValide
              ? colorrs.accent
              : colorrs.inactiveAccent),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
      onPressed: () => nameValide &&
              surnameValide &&
              patronymicValide &&
              dobValide &&
              genderValide
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
