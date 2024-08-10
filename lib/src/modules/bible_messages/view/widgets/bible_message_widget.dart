// ignore_for_file: must_be_immutable

import 'package:app_ibnt/src/modules/bible_messages/bible_messages_imports.dart';

class BibleMessageWidget extends StatelessWidget {
  BibleMessageWidget({
    Key? key,
    required this.user,
    required this.message,
    this.onTap,
  }) : super(key: key);

  BaseUserEntity user;
  final MessageEntity message;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    user = user.userCredential?.role == UserRole.admin ? user as AdminEntity : user as MemberEntity;
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final widgetHeight = height * 0.2;
    final imageContainerSize = height * 0.075;
    final iconSize = height * 0.033;
    final memberNameFontSize = height * 0.02;
    final messageTitleFontSize = height * 0.026;
    final postContentFontSize = height * 0.017;
    final bottomPadding = height * 0.03;
    bool createdMessage = message.messageType == BibleMessageType.created;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: SizedBox(
          height: widgetHeight,
          width: width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: imageContainerSize,
                      width: imageContainerSize,
                      decoration: BoxDecoration(
                        border: !createdMessage || user.profileImage == null ? Border.all(color: AppThemes.primaryColor1, width: 1) : null,
                        shape: BoxShape.circle,
                        image: createdMessage && user.profileImage != null
                            ? DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  user.imageUrl(),
                                ))
                            : const DecorationImage(
                                image: AssetImage(
                                "assets/images/ibnt_logo.png",
                              )),
                      ),
                    ),
                    message.messageType == BibleMessageType.created
                        ? IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.share_outlined,
                              size: iconSize,
                              color: AppThemes.primaryColor1,
                            ),
                          )
                        : Container()
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      message.messageType == BibleMessageType.created ? user.fullName ?? "" : "Mensagem Automática",
                      style: TextStyle(
                        fontSize: memberNameFontSize,
                      ),
                    ),
                    Text(
                      message.title,
                      style: TextStyle(
                        fontFamily: "Karma",
                        fontSize: messageTitleFontSize,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.start,
                        message.content,
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
      ),
    );
  }
}
