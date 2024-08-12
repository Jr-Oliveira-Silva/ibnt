// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ibnt/src/modules/home/home_imports.dart';

class MessageTypeWidget extends StatelessWidget {
  const MessageTypeWidget({
    Key? key,
    required this.message,
    this.onTap,
  }) : super(key: key);

  final MessageEntity message;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final widgetHeight = height * 0.27;
    final imageContainerSize = height * 0.075;
    final iconSize = height * 0.025;
    final memberNameFontSize = height * 0.022;
    final postContentFontSize = height * 0.017;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
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
                      decoration: BoxDecoration(
                        border: message.member?.profileImage != null ? null : Border.all(color: AppThemes.primaryColor1, width: 0.7),
                        shape: BoxShape.circle,
                        image: message.member!.profileImage != null
                            ? DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(message.member!.imageUrl()),
                              )
                            : const DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage(
                                  "assets/images/ibnt_logo.png",
                                ),
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
                                message.member?.fullName ?? "",
                                style: TextStyle(
                                  fontSize: memberNameFontSize,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.library_books_outlined,
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
                  memberId: message.member?.id ?? "",
                  bibleMessageId: message.id!,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
