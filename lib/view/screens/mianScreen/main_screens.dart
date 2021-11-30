import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/network/fire_sore_user.dart';
import 'package:user_app/view/helpers/size_config.dart';
import 'package:user_app/view/screens/meals_list/meals_list.dart';
import 'package:user_app/view/widgets/application_circular_indicator.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
            stream:    FireBaseUtil().getRestaurants(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.data==null || snapshot.data!.docs.isEmpty){
                return const SizedBox(
                  width: 0,
                  height: 0,
                );
              }
              if (!snapshot.hasData) {
                return const Center(
                  child: ApplicationIndicator(),
                );
              }
              return GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                children: snapshot.data!.docs.map((document) {
                  log(document.id);
                  return GestureDetector(
                    onTap: (){
                      log(document['token']);

                      Get.to(MealsList(meals: document['meals'],
                      token: document['token'],));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        width: SizeConfig().screenWidth*.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: const Color(0xff8c52ff),


                        ),
                        child: Center(child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(document['email']),
                        )),

                      ),
                    ),
                  );
                }).toList(),
              );
            }),
      ),
    );
  }
}
