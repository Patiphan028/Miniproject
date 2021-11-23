import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/src/configs/app_route.dart';
import 'package:miniproject/src/configs/app_setting.dart';
import 'package:miniproject/src/widgets/menu_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final List<String> imgList = [
    'https://f.hongpak.in.th/media/rooms/photos/20/0317/142405_5018.jpeg',
    'https://f.ddteedin.com/media/property/thbs3x/20/0725/230628_3558.jpg',
    'https://news.gimyong.com/attachment/image/62038',
    'https://sereneproperty.com/2019/30m/assets/frontend/gallery/exterior/2.jpg',
    'https://www.promptcondo-hatyai.com/wp-content/uploads/2018/07/atmos-2.jpg',
  ];

  List<Map<String, String>> imgArray = [
    {
      "img":
          "https://images.unsplash.com/photo-1501084817091-a4f3d1d19e07?fit=crop&w=2700&q=80",
      "title": "Login",
      "description":
          "You need a creative space ready for your art? We got that covered.",
      "price": "\$125",
      "page": "login"
    },
    {
      "img":
          "https://images.unsplash.com/photo-1500628550463-c8881a54d4d4?fit=crop&w=2698&q=80",
      "title": "Info",
      "description":
          "Don't forget to visit one of the coolest art galleries in town.",
      "price": "\$200",
      "page": "info"
    },
    {
      "img":
          "https://images.unsplash.com/photo-1496680392913-a0417ec1a0ad?fit=crop&w=2700&q=80",
      "title": "Video Services",
      "description":
          "Some of the best music video services someone could have for the lowest prices.",
      "price": "\$300",
      "page": "upcoming"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          // Important: Remove any padding from the ListView.
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('patian'),
              accountEmail: Text('jame@phgmail.com'),
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/ภูบีช-.jpg'),
                  fit: BoxFit.cover)),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/jame.jpg'),
              ),
            ),
            ...MenuViewModel()
                .items
                .map((e) => ListTile(
                      leading: Icon(
                        e.icon,
                        color: e.iconColor,
                      ),
                      title: Text(e.title),
                      onTap: () {
                        e.onTap(context);
                        // Update the state of the app.
                        // ...
                      },
                    ))
                .toList(),
            Spacer(),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.green,
              ),
              title: Text('Logout'),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove(AppSetting.userNameSetting);
                prefs.remove(AppSetting.passwordSetting);
                Navigator.pushNamed(context, AppRoute.LoginRoute);
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('หน้าหลัก'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/ภูบีช-.jpg'),
              alignment: Alignment.topCenter),
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 300),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.apmRout);
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      image: DecorationImage(
                          image: AssetImage('assets/images/home.png'),
                          scale: 10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        //Text('MOVIE'),
                        SizedBox(width: 50),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 30),
                GestureDetector(
                  onTap: () {
                    //Navigator.pushNamed(context, AppRoute.condoRout);
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.condoRout);
                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        image: DecorationImage(
                            image: AssetImage('assets/images/condominium.png'),
                            scale: 10),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.mapRoute);
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      image: DecorationImage(
                          image: AssetImage('assets/images/placeholder.png'),
                          scale: 10),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            CarouselSlider.builder(
              itemCount: imgList.length,
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              itemBuilder: (context, index, realIdx) {
                return Container(
                  child: Center(
                      child: Image.network(imgList[index],
                          fit: BoxFit.cover, width: 1000)),
                );
              },
            ),
            SizedBox(height: 20),
            Text(
              'คอนโดมีเนี่ยน อพาร์ทเมนท์ หอพัก',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            SizedBox(
              height: 100,
              width: 300,
              child: Divider(
                color: Colors.black26,
                thickness: 5,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'ประเภทที่พัก',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlueAccent),
            ),
            SizedBox(height: 20),
            CarouselSlider(
              items: imgArray
                  .map((item) => GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, item["page"]);
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.4),
                                        blurRadius: 8,
                                        spreadRadius: 0.3,
                                        offset: Offset(0, 3))
                                  ]),
                                  child: AspectRatio(
                                    aspectRatio: 2 / 2,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image.network(
                                        item["img"],
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: Column(children: [
                                    Text(item["price"],
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.cyan)),
                                    Text(item["title"],
                                        style: TextStyle(
                                            fontSize: 32, color: Colors.black)),
                                  ]))
                            ],
                          ),
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                  height: 530,
                  autoPlay: false,
                  enlargeCenterPage: false,
                  aspectRatio: 4 / 4,
                  enableInfiniteScroll: false,
                  initialPage: 0,
                  // viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}
