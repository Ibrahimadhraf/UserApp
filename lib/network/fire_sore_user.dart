import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_app/model/orders_model.dart';
import 'package:user_app/model/user_model.dart';

class FireBaseUtil{
  FireBaseUtil._internal();

  static final FireBaseUtil _instance = FireBaseUtil._internal();

  factory FireBaseUtil() => _instance;
  final CollectionReference _userCollectionsRef=FirebaseFirestore.instance.collection('Users');
  final CollectionReference _adminCollectionsRef=FirebaseFirestore.instance.collection('Admins');
  final CollectionReference _ordersCollectionsRef=FirebaseFirestore.instance.collection('Orders');
  Future<void> addUserToFireStore(UserModel userModel)async{
    return await _userCollectionsRef.doc(userModel.email)
        .set(userModel.toJson());
  }
  Future<void>addOrderToFireStore(OrdersModel ordersModel) async{
    return  await _ordersCollectionsRef.doc(ordersModel.title)
        .set(ordersModel.toJson());
  }
  getCurrentUser()async{
    return  _userCollectionsRef.get();
  }
  getRestaurants()  {
    var value = _adminCollectionsRef.snapshots();

    return  value;
  }
}