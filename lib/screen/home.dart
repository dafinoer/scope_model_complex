import 'package:flutter/material.dart';
import 'package:scope_model_spacex/widget/listview_upcoming.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scope_model_spacex/providers/upcoming_list.model.dart';

class Home extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Upcoming'),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                color: Colors.transparent,
                child: GestureDetector(
                  onTap: (){},
                  child: Stack(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.list,
                         color: Colors.white,
                        ), 
                        onPressed: null,
                      ),
                      ScopedModelDescendant<FavoriteLaunch>(
                        builder: (context, widget, models) => models.dataList.length == 0 ? Container() : Positioned(
                          top: 3.0,
                          right: 4.0,
                          child: Container(
                            padding: EdgeInsets.all(1.0),
                            child: Text(models.dataList.length.toString()),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6)
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        body: ListViewUpcoming(),
      );
  }
}