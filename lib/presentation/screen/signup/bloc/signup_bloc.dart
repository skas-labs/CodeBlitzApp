import 'package:bloc/bloc.dart';
import 'package:code_blitz/model/repo/auth_repository.dart';
import 'package:meta/meta.dart';

import 'bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepository;

  SignUpBloc({@required this.authRepository}) : super(DefaultState());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SendOtp) {
      yield* _mapSendOtpToState(event.phone);
    }
  }

  Stream<SignUpState> _mapSendOtpToState(String phone) async* {
    try {
      final response = await authRepository.sendOtp(phone);
      yield SignUpLoaded(response);
    } catch (e) {
      yield SignUpNotLoaded(e.toString());
    }
  }
}
