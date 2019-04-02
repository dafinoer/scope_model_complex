import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scope_model_spacex/model/upcoming.dart';

class FavList extends StatefulWidget{
  
  // routing 
  static const routeName = '/FavList';

  final Upcoming upcoming;

  FavList({this.upcoming});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FavListState();
  }
}

class FavListState extends State<FavList>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(child: Text('this is data'),),
    );
  }
}