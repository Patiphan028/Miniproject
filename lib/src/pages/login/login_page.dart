import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/src/configs/app_route.dart';
import 'package:miniproject/src/configs/app_setting.dart';
import 'package:miniproject/src/services/network.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isHidden = false;

  var _usernameController = TextEditingController();
  var _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: Column(

          // Important: Remove any padding from the ListView.
          children: [
            AppBar(
              title: Text('เมนู'),
              // accountName: Text('Patiphan'),
              // accountEmail: Text('jame@gmail.com'),
              // currentAccountPicture: CircleAvatar(
              //   backgroundImage: AssetImage('assets/images/images.jpg'),
            ),
            //),
            // ...MenuViewModel()
            //     .items
            //     .map((e) => ListTile(
            //   leading: Icon(
            //     e.icon,
            //     color: e.iconColor,
            //   ),
            //   title: Text(e.title),
            //   onTap: () {
            //     e.onTap(context);
            //     // Update the state of the app.
            //     // ...
            //   },
            // ))
            //.toList(),
            //Spacer(),
            ListTile(
              leading: Icon(
                Icons.water_damage_outlined,
                color: Colors.teal,
              ),
              title:  Text('ประเภทห้องเช่า'),
              onTap: () async {
                //Navigator.pushNamed(context, AppRoute.roomRout);
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.all_inbox,
                color: Colors.blueAccent,
              ),
              title:  Text('เปรียบเทียบราคาห้องเช่า'),
              onTap: () async {
                Navigator.pushNamed(context, AppRoute.LoginRoute);
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.login,
                color: Colors.blue,

              ),
              title:  Text('ลงชื่อเข้าใช้'),
              onTap: () async {
                Navigator.pushNamed(context, AppRoute.LoginRoute);
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('ลงชื่อผู้ใช้'),
      ),
      backgroundColor: Color(0XFFFeceff1),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // SizedBox(
            //   height: 100,
            // ),

            SizedBox(
              height: 20,
            ),
            // Text(
            //   'เข้าสู่ระบบ',
            //   style: TextStyle(
            //       color: Colors.white, fontSize: 30, fontFamily: 'Pacifico'),
            // ),
            SizedBox(
              height: 20,
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _usernameController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'อีมล',
                        icon: Icon(Icons.account_box_outlined)),
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: isHidden,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'รหัสผ่าน',
                      icon: Icon(Icons.smartphone),
                      suffixIcon: IconButton(
                          icon: isHidden
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: togglePasswordVisibility),
                    ),
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed: () async {
                      final username = _usernameController.text;
                      final password = _passwordController.text;

                      //final message = await NetworkService().validateUserLoginDio(username, password);
                      print('login with $username $password');
                      if (username == 'u1' && password == 'p1') {
                        print('login succes');
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setString(AppSetting.userNameSetting, username);
                        prefs.setString(AppSetting.passwordSetting, password);

                        Navigator.pushNamed(context, AppRoute.homeRoute);
                      } else {
                        print('login failed');
                        Flushbar(
                          icon: Icon(
                            Icons.announcement,
                            color: Colors.greenAccent,
                          ),
                          backgroundGradient: LinearGradient(
                              colors: [Colors.teal, Colors.lightBlueAccent]),
                          title: "รหัสผ่านไม่ถูกต้อง",
                          message: "กรุณากรอกรหัสผ่านให้ถูกต้อง",
                          duration: Duration(seconds: 5),
                        )..show(context);
                      }
                    },
                    child: Text('เข้าสู่ระบบ'),
                    // onPressed: () {
                    //   Navigator.pushNamed(context, AppRoute.homeRoute);
                    // },

                    style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(
                    child: Text('สมัครสมาชิก'),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoute.mysignupRout);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),



                ],
              ),
            ),
            //Image.network(
            //'https://github.com/624235032/image01/blob/main/t1.png?raw=true',
            //width: 500,
            //height: 500,
            //),
          ],
        ),
      ),
    );
  }

  void togglePasswordVisibility() => setState(() => isHidden = !isHidden);

}//end class