// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ibnt/src/modules/home/home_imports.dart';

class MessageTypeWidget extends StatelessWidget {
  const MessageTypeWidget({
    Key? key,
    required this.message,
    required this.memberName,
    required this.memberId,
  }) : super(key: key);

  final MessageEntity message;
  final String memberName;
  final String memberId;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final widgetHeight = height * 0.27;
    final imageContainerSize = height * 0.075;
    final iconSize = height * 0.045;
    final memberNameFontSize = height * 0.022;
    final postContentFontSize = height * 0.017;
    return SizedBox(
      height: widgetHeight,
      width: width,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: width * 0.02),
                  child: Container(
                    height: imageContainerSize,
                    width: imageContainerSize,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage("https://images.pexels.com/photos/1309052/pexels-photo-1309052.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: height * 0.01),
                            child: Text(
                              memberName,
                              style: TextStyle(
                                fontSize: memberNameFontSize,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.library_books,
                            color: AppThemes.primaryColor1,
                            size: iconSize,
                          )
                        ],
                      ),
                      Expanded(
                        child: Text(
                          message.content,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontSize: postContentFontSize,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BibleMessageReactionsWidget(
              bibleMessageReaction: BibleMessageReaction(
                name: "",
                memberId: memberId,
                bibleMessageId: message.id!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
