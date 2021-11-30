import 'package:flutter/material.dart';
import 'package:user_app/view/helpers/application_utils/image_paht_util/image_path_util.dart';


class MainApplicationHeader extends StatelessWidget {
  const MainApplicationHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
     image: AssetImage(ImagePathUtil().bigHeaderPath??""),
     fit: BoxFit.cover,
        );
  }
}
