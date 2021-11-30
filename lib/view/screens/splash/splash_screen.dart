import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/view/helpers/application_utils/color_utils/colors.dart';
import 'package:user_app/view/helpers/application_utils/key_chain_utils/key_chain_utils.dart';
import 'package:user_app/view/helpers/size_config.dart';
import 'package:user_app/view/screens/login/login_screen.dart';
import 'package:user_app/view/screens/mianScreen/main_screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final int timerDurationMilliseconds = 1200;

  final int navigateDurationMilliseconds = 3000;
late String? email;
  @override
  initState() {

        gotoNext();
        KeyChainUtils().getEmail().then((value) {
          email=value;

        });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      backgroundColor: mainColor,
    );
  }
  gotoNext() => Future.delayed(
      Duration(
        milliseconds: navigateDurationMilliseconds,
      ), () async {
         log(email??"empty");
      Get.offAll(() => email==null? LoginScreen():const MainScreen());


  });
}
