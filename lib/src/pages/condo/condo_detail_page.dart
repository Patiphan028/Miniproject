import 'package:flutter/material.dart';
import 'package:miniproject/src/configs/api.dart';

import 'condo_model.dart';




class CondoDetailPage extends StatefulWidget {
  @override
  _CondoDetailPageState createState() => _CondoDetailPageState();
}

class _CondoDetailPageState extends State<CondoDetailPage> {
  Condo _condoModel;
  @override
  void initState() {
    _condoModel = Condo();
    super.initState();
  }

  Widget build(BuildContext context) {
    Object arguments = ModalRoute.of(context).settings.arguments;
    if (arguments is Condo) {
      _condoModel = arguments;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_condoModel.condoName),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(

        child: Card(
          color: Colors.white,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: [
              SizedBox(
                width: 500,

                child: Image.network(
                    API.CONDO_IMAGE + _condoModel.condoImage),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '' + _condoModel.condoName,
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: Divider(
                  color: Colors.green,
                  thickness: 3,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'รายละเอียด',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(_condoModel.condoLocation),
              SizedBox(
                height: 10,
              ),

              Text(_condoModel.condoDetail),


              SizedBox(height: 15),
              Text(
                'Comment',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
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
      ),
    );
  }
}
