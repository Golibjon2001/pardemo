import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pardemo/http_model/emp_model.dart';
import 'package:pardemo/http_model/emplist_model.dart';
import 'package:pardemo/pages/detail_page.dart';
import 'package:pardemo/serves/http_serves.dart';

class Hom_Page extends StatefulWidget {
  static const String id="homepage";
  const Hom_Page({Key? key}) : super(key: key);

  @override
  _Hom_PageState createState() => _Hom_PageState();
}
class _Hom_PageState extends State<Hom_Page> {

List<Emploee> lis=[];
   void _apiList(){
    Network.GET(Network.API_EM_LIST,Network.apiGet()).then((response) => {
      print(response),
      _showrespons(response),
    });
  }

  void _showrespons(String respons){
    EmList emList=Network.parsingList(respons);
    lis=emList.data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiList();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text("Employe List"),
        centerTitle: true,
      ),
      body:ListView.builder(
        itemCount: lis.length,
          itemBuilder: (ctx ,x){
          return _itmList(lis[x]);
          }
      ),
    );
  }

  Widget _itmList(Emploee emp){
     return GestureDetector(
       onTap: (){
         Navigator.pushReplacementNamed(context, Detail_Page.id);
       },
       child: Container(
         padding: EdgeInsets.all(20),
         margin: EdgeInsets.only(bottom: 1),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(emp.employee_name +"("+emp.employee_age.toString()+")",style: TextStyle(color: Colors.black,fontSize: 20),),
             SizedBox(height: 20,),
             Text(emp.employee_salary.toString()+'\$',style: TextStyle(color: Colors.black,fontSize: 20),),
           ],
         ),
       ),
     );
  }
}
