import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scope_model_spacex/model/upcoming.dart';
import 'package:scope_model_spacex/providers/upcoming_list.model.dart';

class DetailScreen extends StatelessWidget {

  static const routeName = '/detail';

  final Upcoming upcoming;

  DetailScreen({
    Key key,
    this.upcoming
    }) : super(key:key);
  
  @override
  Widget build(BuildContext context) {

    final fav = FavoriteLaunch.of(context);
    fav.setName(upcoming.missionName);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(upcoming.missionName),
            expandedHeight: 250.0,
            floating: true
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildListDelegate([
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                color: Colors.white,
                child: Text(fav.getName)
              )
          ]),)
        ],
      ),
      floatingActionButton: ScopedModelDescendant<FavoriteLaunch>(
        rebuildOnChange: false,
        builder: (context, widget, model)=> FloatingActionButton(
            child: Icon(Icons.add),
        onPressed : model.addFavorite,
        )
      ),
    );
  }

}