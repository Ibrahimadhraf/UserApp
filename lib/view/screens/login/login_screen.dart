import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:user_app/view/helpers/application_utils/color_utils/colors.dart';
import 'package:user_app/view/helpers/application_utils/textfieldutils/text_field_utils.dart';
import 'package:user_app/view/helpers/size_config.dart';
import 'package:user_app/view/widgets/application_circular_indicator.dart';
import 'package:user_app/view/widgets/common_text_controller.dart';
import 'package:user_app/view/widgets/costume_text.dart';
import 'package:user_app/view/widgets/custome_button.dart';
import 'package:user_app/view/widgets/horizontal_space.dart';
import 'package:user_app/view/widgets/main_app_header.dart';
import 'package:user_app/view_model/login_view_model.dart';
class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormFieldState> emailFormFieldState = GlobalKey();
  final GlobalKey<FormFieldState> passwordFormFieldState = GlobalKey();
  final TextEditingController emailTextEditingController =
  TextEditingController();
  final TextEditingController passwordTextEditingController =
  TextEditingController();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<LoginViewModel>(
      init: Get.put(LoginViewModel()),
        builder:(ref) =>
        Scaffold(
          body: SingleChildScrollView(
            child: Column(

              children:  [
                const MainApplicationHeader(),
                CostumeText(text: 'Welcome',
                  fontSize: SizeConfig().fontSize20,
                  textColor:  secondaryColor,
                  fontWeight: FontWeight.w500
                  ,),
                CostumeText(text: 'User',
                  fontSize: SizeConfig().fontSize17,
                  textColor: customBlue900,
                  fontWeight: FontWeight.normal
                  ,),
                HorizontalSpace(
                  space: SizeConfig().blockSizeVertical*5,
                ),
                CommonTextControllers.customTextField(

                    controller: emailTextEditingController,
                    formKey: emailFormFieldState,
                    focusNode: emailFocus,
                    labelText: 'Enter  Your Email ',
                    height: SizeConfig().safeBlockVertical * 7,
                    width: SizeConfig().screenWidth * .8,
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
                      TextFieldUtils().fieldFocusChange(
                          context, emailFocus, passwordFocus);
                    }),
                HorizontalSpace(
                  space: SizeConfig().blockSizeVertical*3,
                ),
                CommonTextControllers.customTextField(
                  controller: passwordTextEditingController,
                  focusNode: passwordFocus,
                  formKey: passwordFormFieldState,
                  labelText: 'Password',
                  height: SizeConfig().safeBlockVertical * 7,
                  width: SizeConfig().screenWidth * .8,
                  keyboardType: TextInputType.number,
                  isObscureText: ref.isSecure,
                  suffix: InkWell(
                    onTap: () {
                      ref.togglePassword();
                    },
                    child: Icon(
                      ref.isSecure==false
                          ? Icons.visibility
                          : Icons.visibility_off,
                      size: SizeConfig().fontSize15,
                      color:mainColor,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Please password cannot be 6 characters';
                    }
                    else{
                      return null;
                    }

                  },

                ),
                HorizontalSpace(
                  space: SizeConfig().blockSizeVertical*5,
                ),
                ref.isLoading==false?   CostumeButton( text: "LOGIN",onPress: (){
                  //   Get.to(const MainScreen());
                  if(emailFormFieldState.currentState!.isValid&& emailFormFieldState.currentState!.isValid ){
                     ref.storeUser(
                       password: passwordTextEditingController.text,
                       email: emailTextEditingController.text
                     );
                  }

                },):
                const ApplicationIndicator(),
                HorizontalSpace(
                  space: SizeConfig().blockSizeVertical*2,
                ),


              ],
            ),
          ),

        ));
  }
}
