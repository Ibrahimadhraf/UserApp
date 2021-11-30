import 'package:flutter/material.dart';

class VerticalListView extends StatelessWidget {
  final   IndexedWidgetBuilder listChildren;
  final int itemCount;


  const VerticalListView({Key? key,  required this.listChildren,required this.itemCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    physics: const ClampingScrollPhysics(),
    itemCount: itemCount,
    itemBuilder:listChildren,
    );
  }
}
