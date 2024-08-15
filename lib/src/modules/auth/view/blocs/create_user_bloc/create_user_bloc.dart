import 'package:app_ibnt/src/modules/auth/auth_imports.dart';

part 'create_user_events.dart';
part 'create_user_states.dart';

class CreateUserBloc extends Bloc<CreateUserEvents, CreateUserStates> {
  CreateUserBloc(this._repository) : super(CreateUserInitialState()) {
    on<CreateUserEvent>(_mapCreateUserEventToState);
  }

  final IAuthRepository _repository;

  _mapCreateUserEventToState(CreateUserEvent event, Emitter<CreateUserStates> state) async {
    state(CreateUserLoadingState());
    final result = await _repository.createAccount(event.newUserEntity);
    
    result.fold(
      (left) => state(CreateUserFailureState(left.exception)),
      (right) => state(CreateUserSuccessState(right as AuthResponseEntity)),
    );
  }
}
