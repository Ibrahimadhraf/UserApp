import 'package:flutter/material.dart';

class CostumeText extends StatelessWidget {
  final Color? textColor;
  final  double? fontSize;
  final FontWeight?  fontWeight;
  final String ? text;

  const CostumeText({Key? key ,this.fontWeight ,this.fontSize ,this.textColor ,this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(text??"" ,
        maxLines: 1,

        style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontFamily: 'Montserrat-Regular.ttf',


        fontWeight: fontWeight)
    );
  }
}
