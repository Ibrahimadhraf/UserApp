class ImagePathUtil {
  ImagePathUtil._internal();

  static final ImagePathUtil _instance = ImagePathUtil._internal();

  factory ImagePathUtil() => _instance;
  String? bigHeaderPath = 'assets/images/big_header1.png';

}
