import 'package:flutter/cupertino.dart';
import 'package:medic/UI/UserUi/result_screen.dart';
import 'package:medic/UI/UserUi/support_screen.dart';
import 'package:medic/UI/UserUi/user_screen.dart';

import '../UserUi/MainScreen.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _bottomNavigationWidgetState();
}

class _bottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> _tabs = [
      const MainScreen(), // see the HomeTab class below
      const ResultScreen(),
      const SupportScreen(),
      const UserScreen() // see the SettingsTab class below
    ];
    return CupertinoTabScaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        tabBar: CupertinoTabBar(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/analyzes.png'),
                    size: 32,
                  ),
                  label: 'Анализы'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/results.png'),
                    size: 32,
                  ),
                  label: 'Результаты'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/supporting.png'),
                    size: 32,
                  ),
                  label: 'Поддержка'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/users.png'),
                    size: 32,
                  ),
                  label: 'Пользователи'),
            ]),
        tabBuilder: (context, index) {
          return _tabs[index];
        });
  }
}
