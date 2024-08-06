import 'package:app_ibnt/src/app_imports.dart';

void callAppDialog(BuildContext context, String title, String message, Function() submit, Function() cancel) {
  final height = MediaQuery.sizeOf(context).height;

  ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
    backgroundColor: Colors.white,
    dividerColor: AppThemes.primaryColor1,
    content: SizedBox(
      height: height * 0.09,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20),
          Text(
            message,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
    actions: [
      IconButton(
        onPressed: cancel,
        icon: const Icon(
          Icons.close,
          color: AppThemes.primaryColor1,
        ),
      ),
      IconButton(
        onPressed: submit,
        icon: Icon(
          Icons.done,
          color: Colors.green.shade500,
        ),
      ),
    ],
  )
/*     SnackBar(
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
    ), */
      );
}
