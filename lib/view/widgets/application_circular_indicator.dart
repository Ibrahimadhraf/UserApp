import 'package:flutter/material.dart';
import 'package:user_app/view/helpers/application_utils/color_utils/colors.dart';


class ApplicationIndicator extends StatelessWidget {
  const ApplicationIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: mainColor,
    );
  }
}
