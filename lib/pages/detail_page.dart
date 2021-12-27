

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pardemo/http_model/emp_model.dart';
import 'package:pardemo/pages/hom_page.dart';
import 'package:pardemo/serves/http_serves.dart';
class Detail_Page extends StatefulWidget {
  static final String id="detail";
  const Detail_Page({Key? key}) : super(key: key);

  @override
  _Detail_PageState createState() => _Detail_PageState();
}

class _Detail_PageState extends State<Detail_Page> {

  Emploee? emOnLis;
  String? name;
  int? age;
 int? salary;

  void _apiLis(int id){
    Network.GET(Network.API_EM_ONE+id.toString(), Network.apiGetOne(id)).then((respons) =>{
      print(respons),
      _showrespons(respons)
    });
  }

  void _showrespons(String respons){
    setState(() {
      emOnLis=Network.parsingListOne(respons).data;
      name=emOnLis!.employee_name;
      age=emOnLis!.employee_age;
      salary=emOnLis!.employee_salary;
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiLis(1);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Container(
         child: Row(
           children: [
            IconButton(
                onPressed:(){
                  Navigator.pushReplacementNamed(context, Hom_Page.id);
                },
                icon:Icon(Icons.arrow_back_ios),
            ),
             SizedBox(width: 90,),
             Text("Detail Page"),
           ],
         ),
        ),
        //centerTitle: true,
      ),
      body:Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$name($age)',style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Text('$salary''\$',style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }

}
