part of 'get_departments_bloc.dart';

sealed class GetDepartmentsEvents extends Equatable {
  const GetDepartmentsEvents();

  @override
  List<Object> get props => [];
}

final class GetDepartmentsEvent extends GetDepartmentsEvents {}
