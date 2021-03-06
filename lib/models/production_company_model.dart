import 'BaseModel.dart';

class ProductionCompanyModel implements BaseModel{
  String? id;
  String? name;

  ProductionCompanyModel.fromJson(jsonMap){
    // print"Called from json");
    // printjsonMap.toString());
    try{
      // commented out bcz jsonmap is a single element id
      // id = jsonMap['id'] != null ? jsonMap['id'] : "-1";
      // // printid);
      // // name = jsonMap['name'] != null ? jsonMap['name'].toString() : "";

      id = jsonMap ?? '-1';
    }catch(e){
      // print"PC: " + e.toString());
    }
  }

  @override
  Map<String, dynamic> toMap(){
    var m = <String, dynamic>{};

    m['id'] = int.parse(id!);
    m['name'] = name!;

    return m;
  }
}