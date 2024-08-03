// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable
import 'package:app_ibnt/src/modules/home/home_imports.dart';

class BibleMessageReactionsWidget extends StatefulWidget {
  BibleMessageReactionsWidget({
    Key? key,
    required this.bibleMessageReaction,
  }) : super(key: key);

  BibleMessageReaction bibleMessageReaction;

  @override
  State<BibleMessageReactionsWidget> createState() => _BibleMessageReactionsWidgetState();
}

class _BibleMessageReactionsWidgetState extends State<BibleMessageReactionsWidget> {
  final String _firstReactionTag = "Glória";
  final String _secondReactionTag = "Aleluia";
  final String _thirdReactionTag = "Abençoado";
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final titleFontSize = height * 0.012;
    final contentPadding = height * 0.007;

    final bibleMessagesReactionsBloc = context.read<BibleMessagesReactionsBloc>();

    return SizedBox(
      height: height * 0.05,
      width: width,
      child: BlocBuilder(
        bloc: bibleMessagesReactionsBloc,
        builder: (context, state) {
          if (state is BibleMessageReactionsLoadingState) {
            return Center(
                child: LinearProgressIndicator(
              color: Colors.grey[50],
              backgroundColor: Colors.grey[100],
              minHeight: height * 0.045,
            ));
          }
          if (state is BibleMessageReactionSuccessState) {
            return Row(
              children: [
                Expanded(
                  child: InkWell(
                    splashColor: AppThemes.primaryColor1.withOpacity(0.4),
                    onTap: () {
                      if (!bibleMessagesReactionsBloc.bibleMessageReactedByMember(
                            state.bibleMessages,
                            widget.bibleMessageReaction.memberId,
                            widget.bibleMessageReaction.bibleMessageId,
                          ) &&
                          !bibleMessagesReactionsBloc.selectedReaction(
                            state.bibleMessages,
                            widget.bibleMessageReaction.memberId,
                            widget.bibleMessageReaction.bibleMessageId,
                            _firstReactionTag,
                          )) {
                        widget.bibleMessageReaction.name = _firstReactionTag;
                        bibleMessagesReactionsBloc.add(ReactionOnBibleMessageEvent(widget.bibleMessageReaction));
                      } else if (bibleMessagesReactionsBloc.bibleMessageReactedByMember(
                            state.bibleMessages,
                            widget.bibleMessageReaction.memberId,
                            widget.bibleMessageReaction.bibleMessageId,
                          ) &&
                          !bibleMessagesReactionsBloc.selectedReaction(
                            state.bibleMessages,
                            widget.bibleMessageReaction.memberId,
                            widget.bibleMessageReaction.bibleMessageId,
                            _firstReactionTag,
                          )) {
                        final updateReactionEntity = UpdateReactionEntity(
                          _firstReactionTag,
                          widget.bibleMessageReaction.memberId,
                          widget.bibleMessageReaction.bibleMessageId,
                          EntityType.message,
                        );
                        bibleMessagesReactionsBloc.add(UpdateBibleMessageReactionEvent(updateReactionEntity));
                      }
                    },
                    onDoubleTap: () {
                      if (bibleMessagesReactionsBloc.selectedReaction(
                        state.bibleMessages,
                        widget.bibleMessageReaction.memberId,
                        widget.bibleMessageReaction.bibleMessageId,
                        _firstReactionTag,
                      )) {
                        final removeReactionEntity = RemoveReactionEntity(
                          widget.bibleMessageReaction.memberId,
                          widget.bibleMessageReaction.bibleMessageId,
                        );
                        bibleMessagesReactionsBloc.add(RemoveBibleMessageReactionEvent(removeReactionEntity));
                      } else {
                        return;
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(contentPadding),
                      child: Container(
                        decoration: BoxDecoration(
                          border: bibleMessagesReactionsBloc.bibleMessageReactedByMember(
                                    state.bibleMessages,
                                    widget.bibleMessageReaction.memberId,
                                    widget.bibleMessageReaction.bibleMessageId,
                                  ) &&
                                  bibleMessagesReactionsBloc.selectedReaction(state.bibleMessages, widget.bibleMessageReaction.memberId, widget.bibleMessageReaction.bibleMessageId, _firstReactionTag)
                              ? Border.all(
                                  color: AppThemes.primaryColor1,
                                )
                              : null,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Icon(
                                Icons.front_hand_sharp,
                                color: bibleMessagesReactionsBloc.bibleMessageReactedByMember(
                                          state.bibleMessages,
                                          widget.bibleMessageReaction.memberId,
                                          widget.bibleMessageReaction.bibleMessageId,
                                        ) &&
                                        bibleMessagesReactionsBloc.selectedReaction(
                                            state.bibleMessages, widget.bibleMessageReaction.memberId, widget.bibleMessageReaction.bibleMessageId, _firstReactionTag)
                                    ? AppThemes.primaryColor1
                                    : AppThemes.secondaryColor1,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(contentPadding),
                                child: Text(
                                  _firstReactionTag,
                                  style: TextStyle(
                                    fontSize: titleFontSize,
                                    color: bibleMessagesReactionsBloc.bibleMessageReactedByMember(
                                              state.bibleMessages,
                                              widget.bibleMessageReaction.memberId,
                                              widget.bibleMessageReaction.bibleMessageId,
                                            ) &&
                                            bibleMessagesReactionsBloc.selectedReaction(
                                              state.bibleMessages,
                                              widget.bibleMessageReaction.memberId,
                                              widget.bibleMessageReaction.bibleMessageId,
                                              _firstReactionTag,
                                            )
                                        ? AppThemes.primaryColor1
                                        : AppThemes.secondaryColor1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: AppThemes.primaryColor1.withOpacity(0.4),
                    onTap: () {
                      if (!bibleMessagesReactionsBloc.bibleMessageReactedByMember(
                            state.bibleMessages,
                            widget.bibleMessageReaction.memberId,
                            widget.bibleMessageReaction.bibleMessageId,
                          ) &&
                          !bibleMessagesReactionsBloc.selectedReaction(
                            state.bibleMessages,
                            widget.bibleMessageReaction.memberId,
                            widget.bibleMessageReaction.bibleMessageId,
                            _secondReactionTag,
                          )) {
                        widget.bibleMessageReaction.name = _secondReactionTag;
                        bibleMessagesReactionsBloc.add(ReactionOnBibleMessageEvent(widget.bibleMessageReaction));
                      } else if (bibleMessagesReactionsBloc.bibleMessageReactedByMember(
                            state.bibleMessages,
                            widget.bibleMessageReaction.memberId,
                            widget.bibleMessageReaction.bibleMessageId,
                          ) &&
                          !bibleMessagesReactionsBloc.selectedReaction(
                            state.bibleMessages,
                            widget.bibleMessageReaction.memberId,
                            widget.bibleMessageReaction.bibleMessageId,
                            _secondReactionTag,
                          )) {
                        final updateReactionEntity = UpdateReactionEntity(
                          _secondReactionTag,
                          widget.bibleMessageReaction.memberId,
                          widget.bibleMessageReaction.bibleMessageId,
                          EntityType.message,
                        );
                        bibleMessagesReactionsBloc.add(UpdateBibleMessageReactionEvent(updateReactionEntity));
                      }
                    },
                    onDoubleTap: () {
                      if (bibleMessagesReactionsBloc.selectedReaction(
                        state.bibleMessages,
                        widget.bibleMessageReaction.memberId,
                        widget.bibleMessageReaction.bibleMessageId,
                        _secondReactionTag,
                      )) {
                        final removeReactionEntity = RemoveReactionEntity(
                          widget.bibleMessageReaction.memberId,
                          widget.bibleMessageReaction.bibleMessageId,
                        );
                        bibleMessagesReactionsBloc.add(RemoveBibleMessageReactionEvent(removeReactionEntity));
                      } else {
                        return;
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(contentPadding),
                      child: Container(
                        decoration: BoxDecoration(
                          border: bibleMessagesReactionsBloc.bibleMessageReactedByMember(
                                    state.bibleMessages,
                                    widget.bibleMessageReaction.memberId,
                                    widget.bibleMessageReaction.bibleMessageId,
                                  ) &&
                                  bibleMessagesReactionsBloc.selectedReaction(
                                    state.bibleMessages,
                                    widget.bibleMessageReaction.memberId,
                                    widget.bibleMessageReaction.bibleMessageId,
                                    _secondReactionTag,
                                  )
                              ? Border.all(
                                  color: AppThemes.primaryColor1,
                                )
                              : null,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Icon(
                                Icons.waving_hand_sharp,
                                color: bibleMessagesReactionsBloc.bibleMessageReactedByMember(
                                          state.bibleMessages,
                                          widget.bibleMessageReaction.memberId,
                                          widget.bibleMessageReaction.bibleMessageId,
                                        ) &&
                                        bibleMessagesReactionsBloc.selectedReaction(
                                          state.bibleMessages,
                                          widget.bibleMessageReaction.memberId,
                                          widget.bibleMessageReaction.bibleMessageId,
                                          _secondReactionTag,
                                        )
                                    ? AppThemes.primaryColor1
                                    : AppThemes.secondaryColor1,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(contentPadding),
                                child: Text(
                                  _secondReactionTag,
                                  style: TextStyle(
                                    fontSize: titleFontSize,
                                    color: bibleMessagesReactionsBloc.bibleMessageReactedByMember(
                                              state.bibleMessages,
                                              widget.bibleMessageReaction.memberId,
                                              widget.bibleMessageReaction.bibleMessageId,
                                            ) &&
                                            bibleMessagesReactionsBloc.selectedReaction(
                                              state.bibleMessages,
                                              widget.bibleMessageReaction.memberId,
                                              widget.bibleMessageReaction.bibleMessageId,
                                              _secondReactionTag,
                                            )
                                        ? AppThemes.primaryColor1
                                        : AppThemes.secondaryColor1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: AppThemes.primaryColor1.withOpacity(0.4),
                    onTap: () {
                      if (!bibleMessagesReactionsBloc.bibleMessageReactedByMember(
                            state.bibleMessages,
                            widget.bibleMessageReaction.memberId,
                            widget.bibleMessageReaction.bibleMessageId,
                          ) &&
                          !bibleMessagesReactionsBloc.selectedReaction(
                            state.bibleMessages,
                            widget.bibleMessageReaction.memberId,
                            widget.bibleMessageReaction.bibleMessageId,
                            _thirdReactionTag,
                          )) {
                        widget.bibleMessageReaction.name = _thirdReactionTag;
                        bibleMessagesReactionsBloc.add(ReactionOnBibleMessageEvent(widget.bibleMessageReaction));
                      } else if (bibleMessagesReactionsBloc.bibleMessageReactedByMember(
                            state.bibleMessages,
                            widget.bibleMessageReaction.memberId,
                            widget.bibleMessageReaction.bibleMessageId,
                          ) &&
                          !bibleMessagesReactionsBloc.selectedReaction(
                            state.bibleMessages,
                            widget.bibleMessageReaction.memberId,
                            widget.bibleMessageReaction.bibleMessageId,
                            _thirdReactionTag,
                          )) {
                        final updateReactionEntity = UpdateReactionEntity(
                          _thirdReactionTag,
                          widget.bibleMessageReaction.memberId,
                          widget.bibleMessageReaction.bibleMessageId,
                          EntityType.message,
                        );
                        bibleMessagesReactionsBloc.add(UpdateBibleMessageReactionEvent(updateReactionEntity));
                      }
                    },
                    onDoubleTap: () {
                      if (bibleMessagesReactionsBloc.selectedReaction(
                        state.bibleMessages,
                        widget.bibleMessageReaction.memberId,
                        widget.bibleMessageReaction.bibleMessageId,
                        _thirdReactionTag,
                      )) {
                        final removeReactionEntity = RemoveReactionEntity(
                          widget.bibleMessageReaction.memberId,
                          widget.bibleMessageReaction.bibleMessageId,
                        );
                        bibleMessagesReactionsBloc.add(RemoveBibleMessageReactionEvent(removeReactionEntity));
                      } else {
                        return;
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(contentPadding),
                      child: Container(
                        decoration: BoxDecoration(
                          border: bibleMessagesReactionsBloc.bibleMessageReactedByMember(
                                    state.bibleMessages,
                                    widget.bibleMessageReaction.memberId,
                                    widget.bibleMessageReaction.bibleMessageId,
                                  ) &&
                                  bibleMessagesReactionsBloc.selectedReaction(
                                    state.bibleMessages,
                                    widget.bibleMessageReaction.memberId,
                                    widget.bibleMessageReaction.bibleMessageId,
                                    _thirdReactionTag,
                                  )
                              ? Border.all(
                                  color: AppThemes.primaryColor1,
                                )
                              : null,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.light_mode,
                              color: bibleMessagesReactionsBloc.bibleMessageReactedByMember(
                                        state.bibleMessages,
                                        widget.bibleMessageReaction.memberId,
                                        widget.bibleMessageReaction.bibleMessageId,
                                      ) &&
                                      bibleMessagesReactionsBloc.selectedReaction(
                                        state.bibleMessages,
                                        widget.bibleMessageReaction.memberId,
                                        widget.bibleMessageReaction.bibleMessageId,
                                        _thirdReactionTag,
                                      )
                                  ? AppThemes.primaryColor1
                                  : AppThemes.secondaryColor1,
                            ),
                            Padding(
                              padding: EdgeInsets.all(contentPadding),
                              child: Text(
                                _thirdReactionTag,
                                style: TextStyle(
                                  fontSize: titleFontSize,
                                  color: bibleMessagesReactionsBloc.bibleMessageReactedByMember(
                                            state.bibleMessages,
                                            widget.bibleMessageReaction.memberId,
                                            widget.bibleMessageReaction.bibleMessageId,
                                          ) &&
                                          bibleMessagesReactionsBloc.selectedReaction(
                                            state.bibleMessages,
                                            widget.bibleMessageReaction.memberId,
                                            widget.bibleMessageReaction.bibleMessageId,
                                            _thirdReactionTag,
                                          )
                                      ? AppThemes.primaryColor1
                                      : AppThemes.secondaryColor1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
