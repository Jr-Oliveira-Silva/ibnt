// ignore_for_file: must_be_immutable

import 'package:app_ibnt/src/app_imports.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget({
    super.key,
    required super.preferredSize,
    this.actions,
  }) : super(child: Container());

  List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: SizedBox(
        height: height * 0.045,
        width: width * 0.25,
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Image.asset("assets/images/ibnt_logo.png"),
            const SizedBox(width: 15),
            Padding(
              padding: EdgeInsets.only(top: height * 0.015),
              child: Text(
                "IBNT",
                style: TextStyle(
                  fontFamily: 'Karma',
                  fontSize: height * 0.035,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: actions,
    );
  }
}
