import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medic/style/texxt_style.dart';
import 'package:medic/style/colorrs.dart';
import 'package:provider/provider.dart';

import '../../Domain/models/password_model.dart';

class InputPassword extends StatelessWidget {
  InputPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        child: Provider(
            create: (BuildContext context) => passwordModel(),
            child: PasswordWidget()),
      ),
    );
  }
}

class PasswordWidget extends StatelessWidget {
  PasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<passwordModel>();
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 50, left: 276),
        child: TextButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
              Colors.transparent,
            )),
            child: Text(
              "Пропустить",
              style: TexxtStyle.followingTxtStyle,
            ),
            onPressed: () => model.goToCreateCard(context)),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Text(
          "Создайте пароль",
          style: TexxtStyle.title,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Text(
          "Для защиты ваших персональных данных",
          style: TexxtStyle.subSubTitle,
        ),
      ),
      const inputFieldPassword()
    ]);
  }
}

class inputFieldPassword extends StatefulWidget {
  const inputFieldPassword({super.key});

  @override
  State<inputFieldPassword> createState() => _inputFieldPasswordState();
}

class _inputFieldPasswordState extends State<inputFieldPassword> {
  var number = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
  var inputText = "";
  var actives = [false, false, false, false];
  var clears = [false, false, false, false];
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: SizedBox(
              width: 130,
              height: 18,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 0; i < actives.length; i++)
                        AnimationBox(
                          clear: clears[i],
                          active: actives[i],
                        )
                    ],
                  ),
                ),
              )),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.5,
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 12,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.all(24),
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        color: index == 9
                            ? null
                            : index == 11
                                ? Colors.transparent
                                : colorrs.buttonGrey,
                        shape: BoxShape.circle),
                    child: Center(
                      child: MaterialButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        enableFeedback: false,
                        onPressed: () {
                          setState(() {
                            if (index == 11) {
                              for (var i = 0; i < actives.length; i++) {
                                actives[i] = false;
                                currentIndex = 0;
                              }
                            }
                            if (index != 11 && index != 9) {
                              if (currentIndex >= 4) {
                                inputText = "";
                                for (var i = 0; i < actives.length; i++) {
                                  actives[i] = false;
                                  currentIndex = 0;
                                }
                              }
                              actives[currentIndex] = true;
                              currentIndex++;
                              inputText +=
                                  number[index == 10 ? index - 1 : index]
                                      .toString();
                            }
                          });
                        },
                        child: index == 9
                            ? const SizedBox()
                            : index == 11
                                ? Image.asset("assets/clearIcon.png")
                                : Text(
                                    "${number[index == 10 ? index - 1 : index]}",
                                    style: TexxtStyle.buttonPaswordText,
                                  ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AnimationBox extends StatefulWidget {
  final clear;
  final active;
  const AnimationBox({super.key, this.clear = false, this.active = false});

  @override
  State<AnimationBox> createState() => _AnimationBoxState();
}

class _AnimationBoxState extends State<AnimationBox>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    if (widget.clear) {
      animationController.forward(from: 0);
    }
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) => Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                  border: Border.all(color: colorrs.accent, width: 1),
                  shape: BoxShape.circle,
                  color: widget.active ? colorrs.accent : Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
