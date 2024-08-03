// ignore_for_file: must_be_immutable
import 'package:app_ibnt/src/app_imports.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    super.key,
    this.label,
    this.fieldName,
    this.initialValue,
    this.onChanged,
    this.obscureText = false,
    this.passwordField,
    this.validator,
    this.maxLines,
    this.maxLength,
    this.iconTap,
    this.controller,
  });
  String? label;
  String? fieldName;
  String? initialValue;
  bool obscureText;
  bool? passwordField;
  Function(String)? onChanged;
  String? Function(String?)? validator;
  int? maxLength;
  int? maxLines;
  Function()? iconTap;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      maxLength: maxLength,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines: maxLines ?? 1,
      controller: controller,
      validator: fieldValidator,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.black),
      onChanged: onChanged,
      decoration: InputDecoration(
        label: Text(label ?? ""),
        errorStyle: const TextStyle(color: Colors.black),
        labelStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 0.5),
          borderRadius: BorderRadius.circular(5),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 0.5),
          borderRadius: BorderRadius.circular(5),
        ),
        suffixIcon: passwordField ?? false
            ? IconButton(
                onPressed: iconTap,
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.black,
                  size: 30,
                ),
              )
            : null,
      ),
    );
  }

  String? fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Por favor, informe ${fieldName ?? "campo"}.";
    }
    return null;
  }
}
