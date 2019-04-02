

class Upcoming {
  final String missionName;
  final String launchDateLocal;

  Upcoming({this.missionName, this.launchDateLocal});

  factory Upcoming.fromJson(Map<String, dynamic> json){
    return Upcoming(
      missionName: json['mission_name'],
      launchDateLocal: json['launch_date_local']
    );
  }
}

class UpcomingList {
  final List<Upcoming> dataList;

  UpcomingList({this.dataList});

  factory UpcomingList.fromJson(List<dynamic> json){
    return UpcomingList(
      dataList: json.map((index)=> Upcoming.fromJson(index)).toList()
    );
  }
}