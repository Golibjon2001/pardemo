
import 'package:pardemo/http_model/emp_model.dart';

class EmOnLis{
  String status;
  String message;
  Emploee data;

  EmOnLis.fromJson(Map<String,dynamic> json)
  :status=json['status'],
  message=json['message'],
  data=Emploee.fromJson(json['data']);

  Map<String,dynamic> toJson()=>{
    'status':status,
    'message':message,
    'data':data.toJson(),
  };
}


