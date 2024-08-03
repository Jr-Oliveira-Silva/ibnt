import 'package:app_ibnt/src/modules/home/home_imports.dart';

part 'user_events.dart';
part 'user_states.dart';

class UserBloc extends Bloc<UserEvents, UserStates> {
  UserBloc(this._repository) : super(UserInitialState()) {
    on<GetMemberByIdEvent>(_mapGetMemberByIdEventToState);
  }

  final IHomeRepository _repository;
  late BaseUserEntity user;

  Future<void> _mapGetMemberByIdEventToState(GetMemberByIdEvent event, Emitter<UserStates> state) async {
    state(GetUserLoadingUserState());
    final result = await _repository.getMemberById(event.memberId);
    result.fold(
      (left) => state(GetUserFailureUserState(left.exception)),
      (right) {
        if (right.userCredential!.role == UserRole.admin) {
          user = right as AdminEntity;
          return state(GetUserSuccessState(user));
        } else {
          user = right as MemberEntity;
          return state(GetUserSuccessState(user));
        }
      },
    );
  }
}
