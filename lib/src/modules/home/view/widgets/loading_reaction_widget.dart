import 'package:app_ibnt/src/modules/home/home_imports.dart';

class LoadingReactionWidget extends StatelessWidget {
  const LoadingReactionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const String firstReactionTag = "Glória";
    const String secondReactionTag = "Aleluia";
    const String thirdReactionTag = "Abençoado";

    final height = MediaQuery.sizeOf(context).height;

    final titleFontSize = height * 0.012;
    final contentPadding = height * 0.007;

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(contentPadding),
            child: Row(
              children: [
                const Expanded(
                  child: Icon(
                    Icons.front_hand_sharp,
                    color: AppThemes.secondaryColor1,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(contentPadding),
                    child: Text(
                      firstReactionTag,
                      style: TextStyle(
                        fontSize: titleFontSize,
                        color: AppThemes.secondaryColor1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(contentPadding),
            child: Row(
              children: [
                const Expanded(
                  child: Icon(
                    Icons.waving_hand_sharp,
                    color: AppThemes.secondaryColor1,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(contentPadding),
                    child: Text(
                      secondReactionTag,
                      style: TextStyle(
                        fontSize: titleFontSize,
                        color: AppThemes.secondaryColor1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(contentPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.light_mode,
                  color: AppThemes.secondaryColor1,
                ),
                Padding(
                  padding: EdgeInsets.all(contentPadding),
                  child: Text(
                    thirdReactionTag,
                    style: TextStyle(
                      fontSize: titleFontSize,
                      color: AppThemes.secondaryColor1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
