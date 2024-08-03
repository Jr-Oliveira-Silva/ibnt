import 'package:app_ibnt/src/shared/shared_imports.dart';

class AppSearchWidget extends StatefulWidget {
  const AppSearchWidget({super.key, required this.onChanged});

  final Function(String value) onChanged;
  @override
  State<AppSearchWidget> createState() => _AppSearchWidgetState();
}

class _AppSearchWidgetState extends State<AppSearchWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final searchPaddingSize = height * 0.02;
    final textBottomPadding = height * 0.01;
    final widgetHeight = height * 0.038;
    double radius = 5;
    double cursorWidth = 0.6;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: searchPaddingSize),
      child: Container(
        height: widgetHeight,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            width: width* 0.0015,
            color: AppThemes.primaryColor1,
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        color: AppThemes.primaryColor1,
                        Icons.search,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Expanded(
                      child: Baseline(
                        baseline: height * 0.0245,
                        baselineType: TextBaseline.alphabetic,
                        child: TextField(
                          onChanged: widget.onChanged,
                          cursorWidth: cursorWidth,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                              bottom: textBottomPadding,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
