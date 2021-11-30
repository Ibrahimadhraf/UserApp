import 'main_model.dart';

class OrdersModel extends MaimModel{
  String? description;
  String? title;
  OrdersModel({
   String? email,
    this.title,
    this.description
}):super(password: '',email:  email);

  OrdersModel.fromJson(Map<dynamic,dynamic>?map){

     title=map!['title'];
    email=map['email'];
    description  =map['description'];
  }
  toJson(){
    return{
      'description':description,
      'email':email,
        'title':title,

    };
  }
}