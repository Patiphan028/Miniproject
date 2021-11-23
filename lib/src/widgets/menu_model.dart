
import 'package:flutter/material.dart';
import 'package:miniproject/src/configs/app_route.dart';
class Menu {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Function(BuildContext context) onTap;


  const Menu({
    this.title,
    this.icon,
    this.iconColor = Colors.grey,
    this.onTap,
  });
}


class MenuViewModel {
  MenuViewModel();


  List<Menu> get items => <Menu>[
    Menu(
      title: 'โปรไฟล์',
      icon: Icons.accessibility,
      iconColor: Colors.lightGreen,
      onTap: (context) {
        Navigator.pushNamed(context, AppRoute.infoRoute);
      },
    ),
    Menu(
      title: 'ประเภทห้องเช่า',
      icon: Icons.account_balance_rounded,
      iconColor: Colors.greenAccent,
      onTap: (context) {
        Navigator.pushNamed(context, AppRoute.roomRout);
      },
    ),
    Menu(
      title: 'เปรียบเทียบราคาห้องเช่า',
      icon: Icons.attach_money,
      iconColor: Colors.teal,
      onTap: (context) {
        //Navigator.pushNamed(context, Constant.mapRoute);
      },
    ),
    Menu(
      title: 'เพิ่มห้องเช่า',
      icon: Icons.water_damage_sharp,
      iconColor: Colors.green,
      onTap: (context) {
        Navigator.pushNamed(context,AppRoute.addRout);
      },
    ),


  ];
}