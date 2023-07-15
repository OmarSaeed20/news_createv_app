import '/index.dart';

class BtnWidget extends StatelessWidget {
  const BtnWidget({
    Key? key,
    required this.text,
    required this.onTap,
    this.backgroundColor,
    this.titleColor,
    this.fontSize,
    this.height,
    this.width,
    this.radius,
    this.isLoading = false,
  }) : super(key: key);
  final String text;

  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? titleColor;
  final double? fontSize;
  final double? height;
  final double? width;
  final double? radius;
  final bool isLoading;
  @override
  Widget build(BuildContext context) => Container(
        height: height ?? 48,
        width: width ?? double.infinity,
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular((radius ?? 16.0)),
            color: backgroundColor,
            gradient: LinearGradient(
              colors: [
                AppColors.primaryDeep,
                AppColors.primary.withOpacity(0.8),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
            )),
        child: TextButton(
          onPressed: onTap,
          child: isLoading
              ? const Center(child: LoadingWidget())
              : TextWidget(
                  text,
                  color: titleColor ?? AppColors.white,
                  fontSize: fontSize ?? (16),
                ),
        ),
      );
}
