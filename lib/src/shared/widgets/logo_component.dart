// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ibnt/src/app_imports.dart';

class LogoComponent extends StatelessWidget {
  const LogoComponent({Key? key, required this.logoHeight, this.verticalPadding}) : super(key: key);

  final double logoHeight;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 50),
      child: Column(
        children: [
          SizedBox(
            height: logoHeight * 0.8,
            child: Image.asset("assets/images/ibnt_logo.png")),
          const Text(
            "IBNT",
            style: TextStyle(
              fontFamily: 'Karma',
              fontSize: 40,
            ),
          ),
        ],
      ),
    );
  }
}
