import 'package:flutter/material.dart';

class HorizontalSpace extends StatelessWidget {
  final double? space;

  const HorizontalSpace({Key? key, this.space}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:space,
    );
  }
}