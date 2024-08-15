// ignore_for_file: prefer_const_constructors_in_immutables

part of 'home_bloc.dart';

sealed class HomeStates extends Equatable {
  const HomeStates();

  @override
  List<Object> get props => [];
}

final class HomeInitialState extends HomeStates {}

final class HomeLoadingState extends HomeStates {}

final class EventsReactionsLoadingState extends HomeStates {}

final class BibleMessagessReactionsLoadingState extends HomeStates {}

final class HomeFailureState extends HomeStates {
  final String exception;
  HomeFailureState(this.exception);
}

final class HomeSuccessState extends HomeStates {
  final TimeLineEntity timelineEntity;

  HomeSuccessState(this.timelineEntity);
}
