import '/index.dart';

Widget sizeBoHeight([double? height]) {
  return SizedBox(
    height:  (height ?? 10.0),
  );
}

Widget sizeBoWidth([double? width]) {
  return SizedBox(
    width:  (width ?? 10.0),
  );
}
