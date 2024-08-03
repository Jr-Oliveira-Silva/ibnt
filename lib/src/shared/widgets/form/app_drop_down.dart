// ignore_for_file: must_be_immutable

import 'package:app_ibnt/src/modules/bible_messages/bible_messages_imports.dart';

class AppDropDown<T> extends StatefulWidget {
  const AppDropDown({
    required this.items,
    required this.fieldLabel,
    this.hintText,
    this.onChanged,
    this.onTap,
    super.key,
  });

  final List<T?> items;
  final String fieldLabel;
  final String? hintText;
  final void Function(T? value)? onChanged;
  final void Function()? onTap;


  @override
  State<AppDropDown<T>> createState() => _AppDropDownState<T>();
}

class _AppDropDownState<T> extends State<AppDropDown<T>> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final labelSpacing = height * 0.01;
    final fontSize = height * 0.02;
    final iconSize = height * 0.035;
    final dropdownButtonHeight = height * 0.073;
    final labelFontSize = height * 0.025;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldLabel(
          label: widget.fieldLabel,
          fontSize: labelFontSize,
        ),
        SizedBox(
          height: labelSpacing,
        ),
        SizedBox(
          height: dropdownButtonHeight,
          child: DropdownButtonFormField<T?>(
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            hint: Text(widget.hintText ?? ""),
            items: [
              ...widget.items.map((item) {
                return DropdownMenuItem<T?>(
                  value: item,
                  child: Text("$item"),
                );
              }).toList()
            ],
            dropdownColor: Colors.white,
            style: TextStyle(fontSize: fontSize, color: AppThemes.secondaryColor1),
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppThemes.secondaryColor1)),
              border: OutlineInputBorder(borderSide: BorderSide(color: AppThemes.secondaryColor1)),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppThemes.secondaryColor1)),
            ),
            iconEnabledColor: AppThemes.primaryColor1,
            iconSize: iconSize,
            isDense: true,
            isExpanded: true,
          ),
        ),
      ],
    );
  }
}
