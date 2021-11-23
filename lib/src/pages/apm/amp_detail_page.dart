import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:miniproject/src/configs/api.dart';

import 'amp_model.dart';


class ApmDetailPage extends StatefulWidget {
  @override
  _ApmDetailPageState createState() => _ApmDetailPageState();
}

class _ApmDetailPageState extends State<ApmDetailPage> {
  Apartment _apmModel;
  double rating = 0;
  @override
  void initState() {
    _apmModel = Apartment();
    super.initState();
  }

  Widget build(BuildContext context) {
    Object arguments = ModalRoute.of(context).settings.arguments;
    if (arguments is Apartment) {
      _apmModel = arguments;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(_apmModel.apmName),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 250,
              child: Image.network(
                  API.APARTMENT_IMAGE + _apmModel.apmImage),
            ),
            Text(
              'Name : ' + _apmModel.apmName,
            ),
            Container(
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'รายละเอียด',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(_apmModel.apmDetail,textAlign:TextAlign.center,),
            ElevatedButton(
              onPressed: () {
                //Navigator.pushNamed(context, AppRoute.videoRoute, arguments: _condoModel.id);
              },
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: Text('จองห้องพัก'),
            ),
            SizedBox(
              height: 130,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Rating : $rating'
                      '',
                    style: TextStyle(fontSize: 20),
                  ),
                  RatingBar.builder(
                    minRating: 1,
                    itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                    updateOnDrag: true,
                    onRatingUpdate: (rating) => setState((){
                      this.rating = rating;
                    }),
                  ),

                  TextButton(
                    child: Text(
                      'Show Dialog',
                      style: TextStyle(fontSize: 20),
                    ),
                    //onPressed: () => showRating(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Comment',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'comment..',
                prefixIcon: Icon(Icons.send),
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Colors.white70,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: Colors.black38, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.black38, width: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}