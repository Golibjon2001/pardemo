import 'package:pardemo/http_model/emp_model.dart';

class EmList{
  String status;
  String message;
  List<Emploee> data;

  EmList.fromJson(Map<String,dynamic> tu)
  :status=tu['status'],
  message=tu['message'],
  data=List<Emploee>.from(tu['data'].map((x)=>Emploee.fromJson(x)));

  Map<String,dynamic> toJson()=>{
    'status':status,
    'message':message,
    'data': List<dynamic>.from(data.map((x) => x.toJson())),
  };
}