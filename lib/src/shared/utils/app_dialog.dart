import 'package:app_ibnt/src/app_imports.dart';

void callAppDialog(BuildContext context, String title, String message, Function() submit, Function() cancel) {
  final height = MediaQuery.sizeOf(context).height;
  final width = MediaQuery.sizeOf(context).width;

  ScaffoldMessenger.of(context).showMaterialBanner(
    MaterialBanner(
      backgroundColor: Colors.white,
      dividerColor: AppThemes.primaryColor1,
      content: SizedBox(
        height: height * 0.08,
        width: width,
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
    ),
  );
}
