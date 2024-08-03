// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ibnt/src/modules/home/home_imports.dart';

class AnnouncementCheckBox extends StatefulWidget {
  const AnnouncementCheckBox({Key? key, required this.announcement}) : super(key: key);

  final AnnouncementEntity announcement;
  @override
  State<AnnouncementCheckBox> createState() => _AnnouncementCheckBoxState();
}

class _AnnouncementCheckBoxState extends State<AnnouncementCheckBox> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final itemSpacing = width * 0.04;
    final fontSize = height * 0.02;
    return Row(
      children: [
        Checkbox(
            value: widget.announcement.fixedWarning,
            onChanged: (value) {
              setState(() {
                widget.announcement.fixedWarning = !widget.announcement.fixedWarning;
              });
            }),
        SizedBox(width: itemSpacing),
        Text("Fixar no quadro de avisos", style: TextStyle(fontSize: fontSize)),
      ],
    );
  }
}
