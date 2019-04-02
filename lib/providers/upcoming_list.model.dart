import 'package:scoped_model/scoped_model.dart';
import 'package:scope_model_spacex/model/upcoming.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

class ModelUpcomingList extends Model {

  bool _isLoading = false;
  List<Upcoming> _data;

  void loadingBar(){
    !_isLoading;
    notifyListeners();
  }
  
  Future<UpcomingList> fecthData () async {
    final uri = Uri.https('api.spacexdata.com', '/v3/launches/upcoming');
    final respone = await get(uri);

    if (respone.statusCode == 200){
      return UpcomingList.fromJson(json.decode(respone.body));
    } else{
      Exception('error');
    }
  }

  void fecth () async {
    UpcomingList list = await fecthData();
    _data.addAll(list.dataList.map((index)=> index));
    // notifyListeners();
  }
}


class FavoriteLaunch extends Model{
  List<String> _data = [];

  List<String> get dataList => _data;

  String _missionName;

  void setName(String name) => _missionName = name;

  String get getName => _missionName;

  void addFavorite() {
    print(_missionName);
    _data.add(_missionName);
    notifyListeners();
  }

  static FavoriteLaunch of(BuildContext context) => 
  ScopedModel.of<FavoriteLaunch>(context);

}