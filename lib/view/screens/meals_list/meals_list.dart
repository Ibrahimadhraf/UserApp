import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/view/helpers/size_config.dart';
import 'package:user_app/view/screens/send_order/send_order_screen.dart';



class MealsList extends StatelessWidget {
  final List<dynamic>? meals;
  final String? token;

  const MealsList({Key? key, this.token, this.meals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
          itemCount: meals?.length ?? 0,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                log("test token :$token");
               Get.to(SendOrderScreen(fcmToken: token, mealName: meals?[index],));
              },
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  width: SizeConfig().screenWidth * .3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: const Color(0xff8c52ff),
                  ),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(meals?[index]),
                  )),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
