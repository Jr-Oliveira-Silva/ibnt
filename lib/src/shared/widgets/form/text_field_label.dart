import 'package:app_ibnt/src/app_imports.dart';

// ignore: must_be_immutable
class TextFieldLabel extends StatelessWidget {
  TextFieldLabel({required this.label, this.fontSize,super.key});
  double? fontSize = 15;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
