class Emploee{
  int id;
  String employee_name;
  int employee_salary;
  int employee_age;
  String profile_image;

  Emploee({required this.employee_salary,required this.employee_age,required this.employee_name,required this.profile_image,required this.id});

  Emploee.fromJson(Map<String,dynamic>json)
  :id=json['id'],
  employee_name=json['employee_name'],
  employee_salary=json['employee_salary'],
  employee_age=json['employee_age'],
  profile_image=json['profile_image'];

  Map<String,dynamic> toJson()=>{
    'id':id,
    'employee_name':employee_name,
    'employee_salary':employee_salary,
    'employee_age':employee_age,
    'profile_image':profile_image,
  };

}