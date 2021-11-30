

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/model/user_model.dart';
import 'package:user_app/network/fire_sore_user.dart';
import 'package:user_app/view/helpers/application_utils/key_chain_utils/key_chain_utils.dart';

import 'package:user_app/view/screens/mianScreen/main_screens.dart';


class LoginViewModel extends GetxController {
  final ValueNotifier<bool> _isSecure = ValueNotifier(true);
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);
  bool get isSecure => _isSecure.value;
  bool get isLoading => _isLoading.value;
  void togglePassword() {
    _isSecure.value = !_isSecure.value;
    update();
  }
   storeUser({String ? email,String? password}){

     _isLoading.value=true;
     update();

       FireBaseUtil().getCurrentUser().then((value) {
         var  mails=(value).docs;
         for(int i=0;i<mails.length;i++){
           if(mails[i].id.toLowerCase()==email?.toLowerCase()){
             log(mails[i].id);
                 _isLoading.value=false;
             KeyChainUtils().storeEmail( email: email);
             Get.offAll(const MainScreen());
           }else{
             FireBaseUtil().addUserToFireStore(UserModel(email: email ,password: password)).then((value) {
               _isLoading.value=false;
               KeyChainUtils().storeEmail( email: email);
               Get.offAll(const MainScreen());
             }).catchError((error){
               _isLoading.value=false;
             }
             );
           }
         }
         // log(value.id);
         // if(email?.toLowerCase()==value.id.toLowerCase()){
         //   _isLoading.value=false;
         //   update();
         //   KeyChainUtils().storeEmail( email: email);
         //  Get.offAll(MainScreen());
         // }else{
         //   FireBaseUtil().addUserToFireStore(UserModel(email: email ,password: password)).then((value) {
         //     _isLoading.value=false;
         //     update();
         //     KeyChainUtils().storeEmail( email: email);
         //     Get.offAll(MainScreen());
         //
         //   }).catchError((error){}
         //   );
         // }

       });

  }
}