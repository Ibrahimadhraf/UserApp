import 'package:user_app/model/main_model.dart';

class UserModel extends MaimModel{
UserModel({
  String ?email,
  String ?password
}):super(email: email ,password: password);

  UserModel.fromJson(Map<dynamic,dynamic>?map){


    email=map!['email'];
    password=map['password'];
  }
  toJson(){
    return{
      'password':password,
      'email':email,

    };
  }
}