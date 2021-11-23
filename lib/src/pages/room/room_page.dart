import 'package:flutter/material.dart';
import 'package:miniproject/src/configs/app_route.dart';

class RoomPage extends StatefulWidget {
  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  Future<RoomPage> _upcomingMovieModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightGreen, title: Text('ประเภทห้องเช่า')),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFAAFFA9), Color(0xFFF11FFBD)],
                )
                ),
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                'ประเภทห้องเช่า',
                style: TextStyle(
                    fontSize: 30, fontFamily: 'Pacifico', color: Colors.white),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: Row(
                  children: <Widget>[
                    // Image.network(
                    //   'https://cdn-icons-png.flaticon.com/512/2101/2101155.png',
                    //   width: 60,
                    //   height: 60,
                    //),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoute.condoRout);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: EdgeInsets.all(10),
                  color: Colors.white70,
                  child: Row(
                    children: <Widget>[
                      Image.network(
                        'https://cdn-icons-png.flaticon.com/512/3752/3752680.png',
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'คอนโดมิเนี่ยน',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoute.apmRout);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: EdgeInsets.all(10),
                  color: Colors.white70,
                  child: Row(
                    children: <Widget>[
                      Image.network(
                        'https://cdn-icons-png.flaticon.com/512/887/887989.png',
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'อพาร์ทเมนท์',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoute.dmRout);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: EdgeInsets.all(10),
                  color: Colors.white70,
                  child: Row(
                    children: <Widget>[
                      Image.network(
                        'https://cdn-icons-png.flaticon.com/512/2942/2942593.png',
                        width: 60,
                        height: 60,
                      ),
                      Text('ห้องพัก',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
