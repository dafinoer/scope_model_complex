import 'package:flutter/material.dart';
import 'package:scope_model_spacex/providers/upcoming_list.model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scope_model_spacex/screen/home.dart';
import 'package:scope_model_spacex/model/routing.dart';
import 'package:scope_model_spacex/screen/detail.dart';
import 'package:scope_model_spacex/screen/favlist.dart';

void main() {
  runApp(ScopedModel(
      model: FavoriteLaunch(),
      child:MyApp(),
    )
  );
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings){
        if (settings.name == DetailScreen.routeName){
          final DetailRouting argumentDetail = settings.arguments;

          return MaterialPageRoute(
            builder: (context){
              return DetailScreen(
                upcoming: argumentDetail.upcoming,
              );
            }
          );
        } else if (settings.name == FavList.routeName){
          
          return MaterialPageRoute(
            builder: (context) => FavList()
          );
        }
      },
      title: 'Scope Flutter',
      home: Home()
    );
  }
}