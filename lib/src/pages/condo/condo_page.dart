import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/src/configs/api.dart';
import 'package:miniproject/src/configs/app_route.dart';
import 'package:miniproject/src/services/network.dart';

import 'condo_model.dart';


class CondoPage extends StatefulWidget {
  @override
  _CondoPageState createState() => _CondoPageState();
}

class _CondoPageState extends State<CondoPage> {
  Future<CondoModel> _condoMode;
  bool isSearching = false;

  String _searchText = "";
  _CondoPageState() {
    _filter.addListener(() {
      if(_filter.text.isEmpty){
        setState(() {
          _searchText = "";
          filteredNames = names;
        });

      }else{
        setState(() {
          _searchText = _filter.text;
        });

      }
    });

  }



  @override
  void initState() {
    _getNames();
    super.initState();
  }

  List names = new List();
  List filteredNames = new List();

  Future<void> _getNames() async {
    List tempList = new List();

    _condoMode = NetworkService().getAllCondoDio();
    if (_condoMode.toString().isNotEmpty) {
      await _condoMode.then((value) => {
        for (int i = 0; i < value.condos.length; i++)
          {
            tempList.add(value.condos[i]),
          }
      });
    } //end if
    setState(() {
      names = tempList;
      names.shuffle();
      filteredNames = names;
    });
  } //end method

  @override
  Widget build(BuildContext context) {
    if(!_searchText.isEmpty){
      List tempList = new List();
      for(int i = 0; i < filteredNames.length; i++){
        Condo condo = filteredNames[i];
        if(condo.condoId.toLowerCase().contains(_searchText.toLowerCase())){
          tempList.add(filteredNames[i]);

        }

      }
      filteredNames = tempList;

    }else{
      filteredNames = names;
    }
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        child: FutureBuilder<CondoModel>(
            future: NetworkService().getAllCondoDio(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 1,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5),
                  itemCount: names == null ? 0 : filteredNames.length,
                  itemBuilder: (context, index) {
                    Condo condo = filteredNames[index];
                    return Material(
                      child: InkWell(
                        // onTap: () {
                        //   Navigator.pushNamed(
                        //       //context, AppRoute.condodetailRoute,
                        //       arguments: condo);
                        // },
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Card(
                              child: Container(
                                color: Colors.green.shade50,
                                child: ListTile(
                                  title: Column(
                                    children: [
                                      condo.condoImage != ""
                                          ? Image.network(
                                        API.CONDO_IMAGE + condo.condoImage,
                                        height: 250,
                                      )
                                          : Image.asset(
                                        'assets/images/no_photo.png',
                                        height: 160,
                                      ),
                                      Text(
                                        condo.condoId + "  " + condo.condoName,
                                        textAlign: TextAlign.center,
                                      ),
                                      condo.condoDetail == '0'
                                          ? Text(
                                        '฿' +
                                            condo.condoPrice +
                                            ' out of stock',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30),
                                      )
                                          : Text('฿' +
                                          condo.condoPrice +
                                          '  ' +
                                          condo.condoPhone +
                                          ''),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 20),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pushNamed(context,
                                                  AppRoute.condoDetailRout,
                                                  arguments: condo);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.green),
                                            child: Text('รายละเอียด'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        backgroundColor: Colors.green.shade300,
        tooltip: 'add',
        child: Icon(Icons.all_inbox),
      ),
    );
  }

  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Search');

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      centerTitle: true,
      title: _appBarTitle,
      actions: [
        IconButton(
            onPressed: () {
              _searchPressed();
            },
            icon: _searchIcon)
      ],
    );
  }

  final TextEditingController _filter = new TextEditingController();

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        print('IF search icon');
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          style: TextStyle(color: Colors.white60, fontSize: 20),
          controller: _filter,
          decoration: new InputDecoration(
              suffixIcon: Icon(Icons.search),
              hintText: 'Search...'
          ),
        );
      } else {
        print('ELSE search icon');
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('');
        filteredNames = names;
        _filter.clear();
      }
    });
  }
}