import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_app/view/helpers/application_utils/color_utils/colors.dart';
import 'package:user_app/view/helpers/size_config.dart';

class CommonTextControllers {
  static Widget customTextField(
      {TextEditingController? controller,
      String? value,
      FormFieldValidator<String>? validator,
      String? labelText,
      Widget? suffix,
      Widget? prefix,
      bool? isObscureText,
      double? height,
      double? width,
      BorderRadius? borderRadius,
      double? fontSize,
      Color? textFieldColor,
      Color? fontColor,
      Color? borderColor,
      Color? fillColor,
      int? maxLines,
      ValueChanged<String>? onChanged,
      VoidCallback? onPrefixPressVCL,
      VoidCallback? onSuffixPressVCL,
      TextInputType? keyboardType,
      FontWeight? fontWeight,
      TextStyle? hintStyle,
      EdgeInsets? containerPadding,
      enabledBorder,
      focusedBorder,
      GlobalKey<FormFieldState>? formKey,
      FocusNode? focusNode,
      ValueChanged<String>? onSubmitted,
      String? language,
      bool inHome = false,
      bool inTam = false,
      bool? isReadOnly,
      List<TextInputFormatter>? inputFormatter}) {
    return Container(
      width: width ?? SizeConfig().safeBlockHorizontal * .2,
      height: height ?? SizeConfig().safeBlockHorizontal * 8,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        readOnly: isReadOnly ?? false,
        initialValue: value,
        key: formKey,
        validator: validator,
        keyboardType: keyboardType ?? TextInputType.text,
        obscureText: isObscureText ?? true,
        controller: controller,
        maxLines: maxLines ?? 1,

        textInputAction: TextInputAction.next,
//language=='ar'? TextAlign.end:TextAlign.start,
        textAlign: TextAlign.start,
        textDirection: TextDirection.ltr,
        // style: TextStyle(
        //     //color: AppColors.
        //     ),
        onChanged: onChanged,
        focusNode: focusNode,
        cursorColor: mainColor,
        onFieldSubmitted: onSubmitted,
        decoration: InputDecoration(
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(SizeConfig().safeBlockHorizontal * 1),
          labelText: labelText ?? '',
          suffixIcon: suffix != null
              ? GestureDetector(
                  onTap: onSuffixPressVCL,
                  child: Padding(
                    padding:
                        EdgeInsets.all(SizeConfig().safeBlockHorizontal * 0),
                    child: suffix,
                  ))
              : const SizedBox(
                  width: 0,
                  height: 0,
                ),
          prefixIcon: prefix != null
              ? GestureDetector(onTap: onPrefixPressVCL, child: prefix)
              : const SizedBox(
                  width: 0,
                  height: 0,
                ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
            borderSide: BorderSide(color: mainColor),
          ),
          enabledBorder: enabledBorder ??
              const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                borderSide: BorderSide(color: mainColor),
              ),
          focusedBorder: focusedBorder ??
              const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                borderSide: BorderSide(color: darkIndigo),
              ),
          hintStyle: hintStyle ??
              TextStyle(
                color: fontColor ?? mainColor,
                fontSize: fontSize ?? SizeConfig().fontSize14,
                // fontWeight: fontWeight ?? FontWeight.w400,
                fontFamily: 'Montserrat-Regular.ttf',
              ),
          labelStyle: hintStyle ??
              TextStyle(
                color: fontColor ?? mainColor,
                fontSize: fontSize ?? SizeConfig().fontSize14,
                fontFamily: 'Montserrat-Regular.ttf',
                // fontWeight: fontWeight ?? FontWeight.w400,
              ),
          errorMaxLines: 2,
          errorStyle: TextStyle(
            color: Colors.red,
            fontSize: SizeConfig().fontSize12,
            fontFamily: 'Montserrat-Regular.ttf',
          ),
          errorBorder: const UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
              borderSide: BorderSide(
                color: whiteOpaque,
              )),
        ),
      ),
    );
  }
}
