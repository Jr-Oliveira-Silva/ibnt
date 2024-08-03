import 'package:app_ibnt/src/app_imports.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.widget,
    this.elevation,
    this.borderRadius,
    this.fontSize,
    this.onTap,
    this.primaryColor,
    this.height,
    this.width,
    this.text,
    this.showBorder,
    this.onlyIcon,
    this.backgroundColor,
  });

  final Widget? widget;
  final Function()? onTap;
  final Color? primaryColor;
  final Color? backgroundColor;
  final String? text;
  final bool? showBorder;
  final bool? onlyIcon;
  final double? borderRadius;
  final double? fontSize;
  final double? elevation;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Container(
            height: height ?? 55,
            width: width,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius ?? 5),
              border: Border.all(color: showBorder ?? false ? primaryColor ?? Colors.white : Colors.transparent),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget != null ? widget! : Container(),
                  widget != null ? const SizedBox(width: 25) : Container(),
                  onlyIcon ?? false
                      ? Container()
                      : Text(
                          text ?? "",
                          style: TextStyle(color: primaryColor, fontSize: fontSize, fontWeight: FontWeight.w400),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
