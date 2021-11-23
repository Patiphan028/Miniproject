import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:miniproject/src/configs/api.dart';
import 'package:miniproject/src/pages/apm/amp_model.dart';
import 'package:miniproject/src/pages/condo/condo_model.dart';
import 'package:miniproject/src/pages/dm/dormitory_model.dart';


class NetworkService{
  NetworkService._internal();

  static final NetworkService _instace = NetworkService._internal();

  factory NetworkService() => _instace;

  static final Dio _dio = Dio();
Future<CondoModel> getAllCondoDio() async {
  //var url = API.BASE_URL + '/flutterapp/getAllGames_7.php';
  var url = API.BASE_URL + API.CONDO;
  print('url getAllCondoDio() = ' + url);
  final response = await _dio.get(url);
  if (response.statusCode == 200) {
    print(response.data);
    return condoModelFromJson(json.encode(response.data));
  }
  throw Exception('Network failed');
}

Future<ApartmentModel> getAllApmDio() async {
  //var url = API.BASE_URL + '/flutterapp/getAllGames_7.php';
  var url = API.BASE_URL + API.APARTMENNT;
  print('url getAllApmDio() = ' + url);
  final response = await _dio.get(url);
  if (response.statusCode == 200) {
    print(response.data);
    return apartmentModelFromJson(json.encode(response.data));
  }
  throw Exception('Network failed');
}

Future<DormitorModel> getAllDmDio() async {
  //var url = API.BASE_URL + '/flutterapp/getAllGames_7.php';
  var url = API.BASE_URL + API.DORMITORY;
  print('url getAllDmDio() = ' + url);
  final response = await _dio.get(url);
  if (response.statusCode == 200) {
    print(response.data);
    return dormitorModelFromJson(json.encode(response.data));
  }
  throw Exception('Network failed');
}

  Future<String> addCondoDio(File imageFile, Condo condo) async {
    FormData data = FormData.fromMap({
      'condo_id': condo.condoId,
      'condo_name': condo.condoName,
      'condo_price': int.parse(condo.condoPrice),
      'condo_detail': condo.condoDetail,
      //'game_img': game.gameImg,

      if (imageFile != null)
        'condo_img': 'has_image'
      else
        'condo_img': 'no_image',
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    });
    try {
      final response = await _dio.post(API.BASE_URL + API.CONDO, data: data);
      print(response);
      if (response != null) {
        if (response.statusCode == 200) {
          print(response.data);
          if (response.data > 0) {
            return 'Add Successfully';
          } else {
            return 'Add Failed';
          }
        }
      } else {
        print('response is nulllllll');
      }
    } catch (DioError) {
      print('Exception --> response is nulllllll');
      print(DioError.toString());
      throw DioError();
    }
  }

  Future<String> editCondoDio(File imageFile, Condo condo) async {
    FormData data = FormData.fromMap({
      'condo_name': condo.condoName,
      'condo_price': condo.condoPrice,
      'condo_detail': condo.condoDetail,
      'condo_img': condo.condoImage,

      // if (imageFile != null)
      //   'photo': await MultipartFile.fromFile(
      //     imageFile.path,
      //     contentType: MediaType('image', 'jpg'),
      //   ),
      if (imageFile != null)
        'condo_img': condo.condoImage
      else
        'condo_img': 'no_image',
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    });

    final response =
    await _dio.post(API.BASE_URL + API.CONDO + '/' + condo.condoId, data: data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.data);
      if (response.data > 0) {
        return 'Edit Successfully';
      } else {
        return 'Edit Failed';
      }
    }
    throw Exception('Network failed');
  }

  MediaType(String s, String t) {}

} // end