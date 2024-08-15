part of 'home_bloc.dart';

sealed class HomeEvents extends Equatable {
  const HomeEvents();

  @override
  List<Object> get props => [];
}

final class FetchTimelineEvent extends HomeEvents {}