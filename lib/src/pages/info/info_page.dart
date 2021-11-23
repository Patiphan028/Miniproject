import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patiphan Info'),backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xFFFAAFFA9), Color(0xFFF11FFBD)],
            )),
          ),
          Column(
            children: <Widget>[
              SizedBox(height: 50,),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/jame.jpg'),
              ),
              SizedBox(height: 20,),
              Text(
                'Patiphan Siriwattano',
                style: TextStyle(
                    fontSize: 30, fontFamily: 'Pacifico', color: Colors.black),
              ),
              SizedBox(height: 30,),
              Text(
                'STUDENT',
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Source Sans Pro',
                    color: Colors.black),
              ),
              SizedBox(
                width: 200,
                height: 30,
                child: Divider(
                  color: Colors.green,
                  thickness: 5,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.account_box_rounded,
                      color: Colors.green,
                    ),
                    Text('Nickname : jame'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      color: Colors.green,
                    ),
                    Text('Tel : 090000'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.email,
                      color: Colors.green,
                    ),
                    Text('Email : 090000')
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
