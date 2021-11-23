
import 'package:flutter/material.dart';
import 'package:miniproject/src/pages/apm/amp_detail_page.dart';
import 'package:miniproject/src/pages/apm/apm_page.dart';
import 'package:miniproject/src/pages/condo/condo_detail_page.dart';
import 'package:miniproject/src/pages/condo/condo_page.dart';
import 'package:miniproject/src/pages/dm/dormitory_detail_page.dart';
import 'package:miniproject/src/pages/dm/dormitory_page.dart';


import 'package:miniproject/src/pages/home/home_page.dart';
import 'package:miniproject/src/pages/info/info_page.dart';
import 'package:miniproject/src/pages/login/login_page.dart';
import 'package:miniproject/src/pages/map/google_map_page.dart';
import 'package:miniproject/src/pages/member/mysignup_page.dart';
import 'package:miniproject/src/pages/room/room_page.dart';
import 'package:miniproject/src/pages/room/roomadd_page.dart';

class AppRoute{
  static const homeRoute = "home";
  static const infoRoute = "info";
  static const LoginRoute = "login";
  static const upcomingMovieRoute = "upcoming";
  static const MovieDetilRoute = "movie";
  static const videoRoute = "video";
  static const qrScanRoute = "qrScan";
  static const qrCreateRoute = "qrCreate";
  static const gameRoute = "game";
  static const gameManagementRoute = "gameManage";
  static const mapRoute = "Map";
  static const mysignupRout = "mysignup";
  static const condoRout = "condo";
  static const condoDetailRout = "condos";
  static const apmRout = "apm";
  static const apmDetailRout = "apms";
  static const roomRout ='room';
  static const dmRout ='dm';
  static const dmDetailRout ='dms';
  static const addRout = 'add';

  final _route = <String, WidgetBuilder>{
    homeRoute: (context) => HomePage(),
    infoRoute: (context) => InfoPage(),
    LoginRoute: (context) => LoginPage(),
    mapRoute: (context) => GoogleMapPage(),
    mysignupRout: (context) => MySignUpPage(),
    condoRout: (context) => CondoPage(),
    condoDetailRout: (context) => CondoDetailPage(),
    apmRout: (context) => ApmPage(),
    apmDetailRout: (context) => ApmDetailPage(),
    roomRout : (context) => RoomPage(),
    dmRout : (context) => DmPage(),
    dmDetailRout : (context) => DmDetailPage(),
    addRout : (context) => RoomaddPage (),

  };

  get getAll => _route;
}//end class