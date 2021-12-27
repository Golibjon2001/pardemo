import 'dart:convert';
import 'package:http/http.dart';
import 'package:pardemo/http_model/emp_model.dart';
import 'package:pardemo/http_model/emplist_model.dart';
import 'package:pardemo/http_model/empliston_model.dart';

import 'package:pardemo/http_model/model.dart';


class Network{
  static String BEST="dummy.restapiexample.com";
  static Map<String,String> headers={'Content-Type':'application/json; charset=UTF-8'};

    /*Http Api*/
 static String API_EM_LIST="/api/v1/employees";
 static String API_EM_ONE="/api/v1/employee/";//{1}
  static String API_EM_CREATE="/api/v1/create";
  static String API_EM_UPDATE="/api/v1/update/";//{21}
  static String API_EM_DELETE="/api/v1/delete/";//{2}



   /*Http Request*/

   static Future <String> GET(String api, Map<String,String> request)async{
   var uri=Uri.http(BEST,api,request );
   var respons= await get(uri,headers:headers );
   if(respons.statusCode==200){
     return respons.body;
   }
   return '';
  }

  static Future <String> GETA(String api, Map<String,String> request)async{
    var uri=Uri.http(BEST,api,request );
    var respons= await get(uri,headers:headers );
    if(respons.statusCode==200){
      return respons.body;
    }
    return '';
  }


  static Future <String> POST(String api, Map<String,String> request)async{
    var uri=Uri.http(BEST,api );
    var respons= await post(uri,headers:headers,body:jsonEncode(request) );
    if(respons.statusCode==200||respons.statusCode==201){
      return respons.body;
    }
    return '';
  }
  static Future <String> PUT(String api, Map<String,String> request)async{
    var uri=Uri.http(BEST,api );
    var respons= await put(uri,headers:headers,body:jsonEncode(request) );
    if(respons.statusCode==200){
      return respons.body;
    }
    return '';
  }

  static Future <String> DELIT(String api, Map<String,String> request)async{
    var uri=Uri.http(BEST,api,request );
    var respons= await delete(uri,headers:headers );
    if(respons.statusCode==200){
      return respons.body;
    }
    return '';
  }

    /*Http Parametrs*/
  static Map<String,String> apiGet(){
    Map<String,String> chqar=Map();
    return chqar;
  }

  static Map<String,String> apiGetOne(int id){
    Map<String,String> chqar=Map();
    return chqar;
  }


  static Map<String,String> apiPost(Post post){
    Map<String,String> chqar=Map();
    chqar.addAll({
      'name':post.name,
      'age':post.age,
      'salary':post.salary,
    });
    return chqar;
  }

  static Map<String,String> apiPut(Post post){
    Map<String,String> chqar=Map();
    chqar.addAll({
      'id':post.id.toString(),
      'name':post.name,
      'age':post.age,
      'salary':post.salary,
    });
    return chqar;
  }

  static Map<String,String> apiDelite(Post post){
    Map<String,String> chqar=Map();
    return chqar;
  }

   /*Http Parsing*/
   static EmList parsingList(String respons){
     dynamic json=jsonDecode(respons);
     var char=EmList.fromJson(json);
     return char;
   }

   static EmOnLis parsingListOne(String respons){
     dynamic json=jsonDecode(respons);
     var rut=EmOnLis.fromJson(json);
     return rut;
   }

}

