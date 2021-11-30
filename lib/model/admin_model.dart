

import 'main_model.dart';

class AdminModel extends MaimModel{
  String ?  userToken ;
  AdminModel({
    String ? email,
    String? password,
    this.userToken,
}):super(email:  email ,password: password);
  AdminModel.fromJson(Map<dynamic,dynamic>map){

     userToken=map['token'];
    email=map['email'];
    password=map['password'];
  }
  toJson(){
    return{
      'password':password,
      'email':email,
      'token':userToken

    };
  }
}