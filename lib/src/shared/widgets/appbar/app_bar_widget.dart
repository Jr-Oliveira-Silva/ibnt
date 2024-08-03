import 'package:app_ibnt/src/app_imports.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget({super.key, required super.preferredSize}) : super(child: Container());

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
      actions: [
        IconButton(
          onPressed: () => Modular.to.pushNamed('/auth/home/notifications'),
          icon: const Icon(
            Icons.notifications_none_outlined,
          ),
        ),
      ],
    );
  }
}
