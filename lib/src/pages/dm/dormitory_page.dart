import 'package:flutter/material.dart';
import 'package:miniproject/src/configs/api.dart';
import 'package:miniproject/src/configs/app_route.dart';
import 'package:miniproject/src/services/network.dart';

import 'dormitory_model.dart';


class DmPage extends StatefulWidget {
  @override
  _DmPageState createState() => _DmPageState();
}

class _DmPageState extends State<DmPage> {
  Future<DormitorModel> _dormitorModel;
  bool isSearching = false;

  String _searchText = "";
  _DmPageState() {
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

    _dormitorModel = NetworkService().getAllDmDio();
    if (_dormitorModel.toString().isNotEmpty) {
      await _dormitorModel.then((value) => {
        for (int i = 0; i < value.dormitorys.length; i++)
          {
            tempList.add(value.dormitorys[i]),
          }
      });
    } //end if
    setState(() {
      names = tempList;
      names.shuffle();
      filteredNames = names;
    });
  }


  @override
  Widget build(BuildContext context) {
    if(!_searchText.isEmpty){
      List tempList = new List();
      for(int i = 0; i < filteredNames.length; i++){
        Dormitory dormitory = filteredNames[i];
        if(dormitory.dmName.toLowerCase().contains(_searchText.toLowerCase())){
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
            child: FutureBuilder<DormitorModel>(
                future: NetworkService().getAllDmDio(),
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
                        Dormitory domitory = filteredNames[index];
                        return Material(
                          child: InkWell(
                            onTap: () {
                              // Navigator.pushNamed(
                              //     context, AppRoute.domitorydetailRoute,
                              //     arguments: domitory);
                            },
                            child: Column(
                              children: [
                                Container(
                                  color: Colors.green.shade50,
                                  child: ListTile(
                                    title: Column(
                                      children: [
                                        domitory.dmImage != ""
                                            ? Image.network(
                                          API.DORMITORY_IMAGE + domitory.dmImage,
                                          height: 200,
                                        )
                                            : Image.asset(
                                          'assets/images/no_photo.png',
                                          height: 160,
                                        ),
                                        Text(
                                          domitory.dmId + "  " + domitory.dmName,
                                          textAlign: TextAlign.center,
                                        ),
                                        domitory.dmDetail == '0'
                                            ? Text('฿' +
                                            domitory.dmPrice +
                                            ' out of stock',
                                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
                                        )
                                            : Text('฿' +
                                            domitory.dmPrice +
                                            '  ' +
                                            domitory.dmPhone +
                                            '' ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            SizedBox(height: 20),
                                            ElevatedButton(
                                              onPressed: () {
                                                 Navigator.pushNamed(context,
                                                     AppRoute.dmDetailRout,
                                                     arguments: domitory);
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
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                })));
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