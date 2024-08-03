// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable
import 'package:app_ibnt/src/modules/home/home_imports.dart';

class EventReactionsWidget extends StatefulWidget {
  EventReactionsWidget({
    Key? key,
    required this.eventReaction,
  }) : super(key: key);

  EventReaction eventReaction;

  @override
  State<EventReactionsWidget> createState() => _EventReactionsWidgetState();
}

class _EventReactionsWidgetState extends State<EventReactionsWidget> {
  final String _firstReactionTag = "Glória";
  final String _secondReactionTag = "Aleluia";
  final String _thirdReactionTag = "Abençoado";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final titleFontSize = height * 0.012;
    final contentPadding = height * 0.007;

    final reactionsBloc = context.read<EventsReactionsBloc>();

    return SizedBox(
      height: height * 0.05,
      width: width,
      child: BlocBuilder(
        bloc: reactionsBloc,
        builder: (context, state) {
          if (state is ReactionsLoadingState) {
            return Center(
                child: LinearProgressIndicator(
                  color: Colors.grey[50],
                  backgroundColor: Colors.grey[100],
              minHeight: height * 0.045,
            ));
          }
          if (state is EventReactionSuccessState) {
            return Row(
              children: [
                Expanded(
                  child: InkWell(
                    splashColor: AppThemes.primaryColor1.withOpacity(0.4),
                    onTap: () {
                      if (!reactionsBloc.eventReactedByMember(
                            state.eventReactions,
                            widget.eventReaction.memberId,
                            widget.eventReaction.eventId,
                          ) &&
                          !reactionsBloc.selectedReaction(
                            state.eventReactions,
                            widget.eventReaction.memberId,
                            widget.eventReaction.eventId,
                            _firstReactionTag,
                          )) {
                        widget.eventReaction.name = _firstReactionTag;
                        reactionsBloc.add(ReactionOnEventOfTimelineEvent(widget.eventReaction));
                      } else if (reactionsBloc.eventReactedByMember(
                            state.eventReactions,
                            widget.eventReaction.memberId,
                            widget.eventReaction.eventId,
                          ) &&
                          !reactionsBloc.selectedReaction(
                            state.eventReactions,
                            widget.eventReaction.memberId,
                            widget.eventReaction.eventId,
                            _firstReactionTag,
                          )) {
                        final updateReactionEntity = UpdateReactionEntity(
                          _firstReactionTag,
                          widget.eventReaction.memberId,
                          widget.eventReaction.eventId,
                          EntityType.event,
                        );
                        reactionsBloc.add(UpdateEventReactionEvent(updateReactionEntity));
                      }
                    },
                    onDoubleTap: () {
                      if (reactionsBloc.selectedReaction(
                        state.eventReactions,
                        widget.eventReaction.memberId,
                        widget.eventReaction.eventId,
                        _firstReactionTag,
                      )) {
                        final removeReactionEntity = RemoveReactionEntity(
                          widget.eventReaction.memberId,
                          widget.eventReaction.eventId,
                        );
                        reactionsBloc.add(RemoveEventReactionEvent(removeReactionEntity));
                      } else {
                        return;
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(contentPadding),
                      child: Container(
                        decoration: BoxDecoration(
                          border: reactionsBloc.eventReactedByMember(
                                    state.eventReactions,
                                    widget.eventReaction.memberId,
                                    widget.eventReaction.eventId,
                                  ) &&
                                  reactionsBloc.selectedReaction(
                                    state.eventReactions,
                                    widget.eventReaction.memberId,
                                    widget.eventReaction.eventId,
                                    _firstReactionTag,
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
                                Icons.front_hand_sharp,
                                color: reactionsBloc.eventReactedByMember(
                                          state.eventReactions,
                                          widget.eventReaction.memberId,
                                          widget.eventReaction.eventId,
                                        ) &&
                                        reactionsBloc.selectedReaction(
                                          state.eventReactions,
                                          widget.eventReaction.memberId,
                                          widget.eventReaction.eventId,
                                          _firstReactionTag,
                                        )
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
                                    color: reactionsBloc.eventReactedByMember(
                                              state.eventReactions,
                                              widget.eventReaction.memberId,
                                              widget.eventReaction.eventId,
                                            ) &&
                                            reactionsBloc.selectedReaction(
                                              state.eventReactions,
                                              widget.eventReaction.memberId,
                                              widget.eventReaction.eventId,
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
                      if (!reactionsBloc.eventReactedByMember(
                            state.eventReactions,
                            widget.eventReaction.memberId,
                            widget.eventReaction.eventId,
                          ) &&
                          !reactionsBloc.selectedReaction(
                            state.eventReactions,
                            widget.eventReaction.memberId,
                            widget.eventReaction.eventId,
                            _secondReactionTag,
                          )) {
                        widget.eventReaction.name = _secondReactionTag;
                        reactionsBloc.add(ReactionOnEventOfTimelineEvent(widget.eventReaction));
                      } else if (reactionsBloc.eventReactedByMember(
                            state.eventReactions,
                            widget.eventReaction.memberId,
                            widget.eventReaction.eventId,
                          ) &&
                          !reactionsBloc.selectedReaction(
                            state.eventReactions,
                            widget.eventReaction.memberId,
                            widget.eventReaction.eventId,
                            _secondReactionTag,
                          )) {
                        final updateReactionEntity = UpdateReactionEntity(
                          _secondReactionTag,
                          widget.eventReaction.memberId,
                          widget.eventReaction.eventId,
                          EntityType.event,
                        );
                        reactionsBloc.add(UpdateEventReactionEvent(updateReactionEntity));
                      }
                    },
                    onDoubleTap: () {
                      if (reactionsBloc.selectedReaction(
                        state.eventReactions,
                        widget.eventReaction.memberId,
                        widget.eventReaction.eventId,
                        _secondReactionTag,
                      )) {
                        final removeReactionEntity = RemoveReactionEntity(
                          widget.eventReaction.memberId,
                          widget.eventReaction.eventId,
                        );
                        reactionsBloc.add(RemoveEventReactionEvent(removeReactionEntity));
                      } else {
                        return;
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(contentPadding),
                      child: Container(
                        decoration: BoxDecoration(
                          border: reactionsBloc.eventReactedByMember(
                                    state.eventReactions,
                                    widget.eventReaction.memberId,
                                    widget.eventReaction.eventId,
                                  ) &&
                                  reactionsBloc.selectedReaction(
                                    state.eventReactions,
                                    widget.eventReaction.memberId,
                                    widget.eventReaction.eventId,
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
                                color: reactionsBloc.eventReactedByMember(
                                          state.eventReactions,
                                          widget.eventReaction.memberId,
                                          widget.eventReaction.eventId,
                                        ) &&
                                        reactionsBloc.selectedReaction(
                                          state.eventReactions,
                                          widget.eventReaction.memberId,
                                          widget.eventReaction.eventId,
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
                                    color: reactionsBloc.eventReactedByMember(
                                              state.eventReactions,
                                              widget.eventReaction.memberId,
                                              widget.eventReaction.eventId,
                                            ) &&
                                            reactionsBloc.selectedReaction(
                                              state.eventReactions,
                                              widget.eventReaction.memberId,
                                              widget.eventReaction.eventId,
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
                      if (!reactionsBloc.eventReactedByMember(
                            state.eventReactions,
                            widget.eventReaction.memberId,
                            widget.eventReaction.eventId,
                          ) &&
                          !reactionsBloc.selectedReaction(
                            state.eventReactions,
                            widget.eventReaction.memberId,
                            widget.eventReaction.eventId,
                            _thirdReactionTag,
                          )) {
                        widget.eventReaction.name = _thirdReactionTag;
                        reactionsBloc.add(ReactionOnEventOfTimelineEvent(widget.eventReaction));
                      } else if (reactionsBloc.eventReactedByMember(
                            state.eventReactions,
                            widget.eventReaction.memberId,
                            widget.eventReaction.eventId,
                          ) &&
                          !reactionsBloc.selectedReaction(
                            state.eventReactions,
                            widget.eventReaction.memberId,
                            widget.eventReaction.eventId,
                            _thirdReactionTag,
                          )) {
                        final updateReactionEntity = UpdateReactionEntity(
                          _thirdReactionTag,
                          widget.eventReaction.memberId,
                          widget.eventReaction.eventId,
                          EntityType.event,
                        );
                        reactionsBloc.add(UpdateEventReactionEvent(updateReactionEntity));
                      }
                    },
                    onDoubleTap: () {
                      if (reactionsBloc.selectedReaction(
                        state.eventReactions,
                        widget.eventReaction.memberId,
                        widget.eventReaction.eventId,
                        _thirdReactionTag,
                      )) {
                        final removeReactionEntity = RemoveReactionEntity(
                          widget.eventReaction.memberId,
                          widget.eventReaction.eventId,
                        );
                        reactionsBloc.add(RemoveEventReactionEvent(removeReactionEntity));
                      } else {
                        return;
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(contentPadding),
                      child: Container(
                        decoration: BoxDecoration(
                          border: reactionsBloc.eventReactedByMember(
                                    state.eventReactions,
                                    widget.eventReaction.memberId,
                                    widget.eventReaction.eventId,
                                  ) &&
                                  reactionsBloc.selectedReaction(
                                    state.eventReactions,
                                    widget.eventReaction.memberId,
                                    widget.eventReaction.eventId,
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
                              color: reactionsBloc.eventReactedByMember(
                                        state.eventReactions,
                                        widget.eventReaction.memberId,
                                        widget.eventReaction.eventId,
                                      ) &&
                                      reactionsBloc.selectedReaction(
                                        state.eventReactions,
                                        widget.eventReaction.memberId,
                                        widget.eventReaction.eventId,
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
                                  color: reactionsBloc.eventReactedByMember(
                                            state.eventReactions,
                                            widget.eventReaction.memberId,
                                            widget.eventReaction.eventId,
                                          ) &&
                                          reactionsBloc.selectedReaction(
                                            state.eventReactions,
                                            widget.eventReaction.memberId,
                                            widget.eventReaction.eventId,
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
