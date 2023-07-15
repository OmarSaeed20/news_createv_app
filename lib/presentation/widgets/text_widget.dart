import '/index.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.text, {
    Key? key,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.fontFamily,
    this.decoration,
    this.maxLines,
    this.textAlign,
    this.hei,
    this.overflow,
  }) : super(key: key);
  final String text;
  final double? fontSize;
  final double? hei;
  final int? maxLines;
  final Color? color;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        decoration: decoration,
        fontSize: 16,
        fontWeight: fontWeight,
        height: hei,
        color: color ?? AppColors.black,
        // fontFamily: DatabaseHelper.to.getString("key")
      ),
    );
  }
}
