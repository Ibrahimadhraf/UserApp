import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:user_app/model/orders_model.dart';
import 'package:user_app/network/fire_sore_user.dart';
import 'package:user_app/network/newt_work_keys.dart';
import 'package:user_app/view/helpers/application_utils/key_chain_utils/key_chain_utils.dart';

class SendOrderViewModel extends GetxController {
 late Position userLocation;
 double cairoLongitude=31.233334;
 double cairoLatitude=30.033333;
 late double distanceInKMeter;
 final ValueNotifier<bool> _isLoading = ValueNotifier(false);
 bool get isLoading => _isLoading.value;
 late String? email;
 Future<Position>  getLocation() async {

    Position position = await Geolocator .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    // print(position.altitude);
    // print(position.longitude);
    return position;

   }
  Future<bool> sendFcmMessage({String? title, String? message ,String ? token}) async {
    _isLoading.value=true;
    update();
   try {

     var url = Uri.parse('https://fcm.googleapis.com/fcm/send');
     var header =<String ,String> {
       "Content-Type": "application/json",
       "Authorization":
       "key=$apikey",
     };
     var request = jsonEncode( <String, dynamic>{
       'notification': <String, dynamic>{
         'body': '$message',
         'title': '$title'
       },
       'priority': 'high',
       'data': <String, dynamic>{
         'click_action': 'FLUTTER_NOTIFICATION_CLICK',
         'id': '1',
     'body': '$message',
     'title': '$title',
         'status': 'done'
       },
       'to': token,
     });

     var client =  http.Client();
     var response =
     await client
         .post(url, body: request, headers: header ,);
     log('$response');
     _isLoading.value=false;
     update();
     return true;

   } catch (e) {
     log("$e");
     return false;
   }

 }
   Future<void> calculateTheDistanceFromCairo()async{
   getLocation().then((value) {
     distanceInKMeter=   Geolocator.distanceBetween(   value.longitude,value.latitude ,cairoLatitude ,cairoLongitude)/1000;
     update();
     log("$distanceInKMeter");
    // print(value.latitude);
   });
   }
    Future addToFireStore({String? title}) async{


      FireBaseUtil().addOrderToFireStore(OrdersModel(email: email ,
      description: "Anew order that locate ${distanceInKMeter.round()} From Cairo" ,title:
      title));
    }
    @override
  void onInit() async {
   getLocation();
   calculateTheDistanceFromCairo();

   email= await  KeyChainUtils().getEmail();
    log(email??'empty');
    super.onInit();
  }
  toggleLoader(){
   _isLoading.value=!_isLoading.value;
   update();
  }
}