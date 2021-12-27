class Post{
  int id;
  String name;
  String salary;
  String age;

  Post({required this.id,required this.salary,required this.age,required this.name});

  Post.toJson(Map<String,dynamic> json)
  :id=json['id'],
  name=json['name'],
  salary=json['salary'],
  age=json['age'];

  Map<String,dynamic> fromJson()=>{
    'id':id,
    'name':name,
    'salary':salary,
    'age':age,
  };
}