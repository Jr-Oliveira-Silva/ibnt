// ignore_for_file: must_be_immutable

import 'package:app_ibnt/src/modules/bible_messages/bible_messages_imports.dart';

class MessageViewPage extends StatefulWidget {
  MessageViewPage({required this.message, super.key});

  MessageEntity message;
  @override
  State<MessageViewPage> createState() => _MessageViewPageState();
}

class _MessageViewPageState extends State<MessageViewPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final pagePadding = width * 0.035;
    final textPadding = height * 0.035;
    final titleFontSize = height * 0.035;
    final textFontSize = height * 0.023;
    // final buttonFontSize = height * 0.02;

    // final bloc = context.read<BibleMessagesBloc>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(preferredSize: Size(width, height * 0.08)),
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          width: width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: pagePadding),
            child: Stack(
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.message.title,
                        style: TextStyle(fontSize: titleFontSize, fontFamily: 'Karma'),
                      ),
                    ),
                    SizedBox(height: textPadding),
                    SizedBox(
                      height: height * 0.6,
                      child: ListView(
                        children: [
                          Text(
                            widget.message.content,
                            style: TextStyle(
                              fontSize: textFontSize,
                              fontFamily: 'Karma',
                            ),
                          ),
                          widget.message.messageType == BibleMessageType.generated
                              ? Container()
                              : Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: height * 0.02),
                                    child: Text(
                                      widget.message.baseText!,
                                      style: TextStyle(fontSize: titleFontSize),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    /* SizedBox(height: height * 0.04),
                     BlocConsumer(
                      bloc: bloc,
                      listener: (context, state) {
                        if (state is PostBibleMessageToTimelineFailureState) {
                          callAppToast(context, state.exception);
                        }
                        if (state is PostBibleMessageToTimelineSuccessState) {
                          Modular.to.navigate('/auth/home/');
                        }
                      },
                      builder: (context, state) {
                        if (state is BibleMessagesLoadingState) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        return AppButton(
                          primaryColor: Colors.white,
                          backgroundColor: AppThemes.primaryColor1,
                          fontSize: buttonFontSize,
                          text: "Compartilhar",
                          onTap: () => bloc.add(PostMessageToTimelineEvent(widget.message)),
                        );
                      },
                    ), */
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppNavBarWidget(pageIndex: 2),
    );
  }
}
