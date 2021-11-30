import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:user_app/view/helpers/size_config.dart';
import 'package:user_app/view/widgets/application_circular_indicator.dart';
import 'package:user_app/view/widgets/common_text_controller.dart';
import 'package:user_app/view/widgets/custome_button.dart';
import 'package:user_app/view_model/send_order_view_model.dart';

class SendOrderScreen extends StatelessWidget {
final  String ? fcmToken;
final String? mealName;
  final GlobalKey<FormFieldState> emailFormFieldState = GlobalKey();
  final TextEditingController emailTextEditingController =
  TextEditingController();
  final emailFocus = FocusNode();

   SendOrderScreen({Key? key ,this.fcmToken ,this.mealName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<SendOrderViewModel>(
      init: Get.put(SendOrderViewModel()),
      builder:(ref) => Scaffold(
           appBar: AppBar(
             toolbarHeight: SizeConfig().screenHeight*.12,
           ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonTextControllers.customTextField(
                    maxLines: 6,
                    inHome: true,
                    controller: emailTextEditingController,
                    formKey: emailFormFieldState,
                    focusNode: emailFocus,
                    labelText: 'Enter  Your Notes ',
                    height: SizeConfig().screenHeight * .25,
                    width: SizeConfig().screenWidth ,
                    isObscureText: false,
                    keyboardType: TextInputType.text,

                    validator: (value) {
                      if(value!.isEmpty){
                        return 'Mail cannot be empty';
                      } else{
                        return null;
                      }

                    },
                    onSubmitted: (value) {

                    }),
              ref.isLoading==false?  CostumeButton( text: "Send",onPress: (){

                  if(emailFormFieldState.currentState!.isValid&& emailFormFieldState.currentState!.isValid ){


                    ref. addToFireStore(title: mealName).then((value) {
                      ref.sendFcmMessage(title: mealName , message:"we have new order" ,token: fcmToken );
                    });

                      ref.toggleLoader();


                }}):const ApplicationIndicator (),
              ],
            ),
          ),
      ),
    );
  }
}
