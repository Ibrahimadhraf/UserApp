import 'package:flutter/material.dart';

import 'package:user_app/view/helpers/application_utils/color_utils/colors.dart';
import 'package:user_app/view/helpers/size_config.dart';

import 'costume_text.dart';

class CostumeButton extends StatelessWidget {
  final String? text;
  final GestureTapCallback? onPress;

  const CostumeButton({Key? key, this.text, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            color: mainColor,
            borderRadius:
                BorderRadius.all(Radius.circular(SizeConfig().fontSize13))),
        height: SizeConfig().safeBlockVertical * 6,
        width: SizeConfig().screenWidth * .8,
        child: Center(
            child: CostumeText(
                text: text ?? '',
                textColor: Colors.white,
                fontSize: SizeConfig().fontSize16,
                fontWeight: FontWeight.normal)),
      ),
    );
  }
}

