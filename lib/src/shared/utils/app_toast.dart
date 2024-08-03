import 'package:app_ibnt/src/shared/shared_imports.dart';

void callAppToast(BuildContext context, String message) {
  final height = MediaQuery.sizeOf(context).height;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      margin: EdgeInsets.symmetric(vertical: height * 0.116, horizontal: 10),
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppThemes.secondaryColor1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      content: Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}
