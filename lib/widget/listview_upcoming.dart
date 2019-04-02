import 'package:flutter/material.dart';
import 'package:scope_model_spacex/providers/upcoming_list.model.dart';
import 'package:scope_model_spacex/model/upcoming.dart';
import 'package:scope_model_spacex/screen/detail.dart';
import 'package:scope_model_spacex/model/routing.dart';

class ListViewUpcoming extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ModelUpcomingList model = ModelUpcomingList();

    return FutureBuilder(
      future: model.fecthData(),
      builder: (context, snapshot){
        if (snapshot.hasData){
          return _buildListTile(snapshot);
        } else if (snapshot.hasError){
          return Center(child: Text('${snapshot.error}'),);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildFuture(Future<UpcomingList> future){
    return FutureBuilder(
      future: future,
      builder: (context, snapshot){
        if (snapshot.hasData){
          return _buildListTile(snapshot);
        } else if (snapshot.hasError){
          return Center(child: Text('error'),);
        }
        return Center(child: CircularProgressIndicator(),);
      },
    );
  }

  Widget _buildListTile(AsyncSnapshot<UpcomingList> snapshot){
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      separatorBuilder: (context, index)=> Divider(),
      itemCount: snapshot.data.dataList.length,
      itemBuilder: (context, index){
        return ListTile(
          title: Text(snapshot.data.dataList[index].missionName),
          onTap: (){
            // Navigator.pushNamed(context, DetailScreen.routeName, arguments: DetailRouting(
            //   upcoming: snapshot.data.dataList[index]
            // ));
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => DetailScreen(upcoming: snapshot.data.dataList[index],)
            ));
          },
        );
      },
    );
  }
}