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
    }else  if (event is VerifyOtp) {
      yield* _mapVerifyOtpToState(event.body);
    }
  }

  Stream<SignUpState> _mapSendOtpToState(String phone) async* {
    try {
      final response = await authRepository.sendOtp(phone);
      yield OtpSent(response);
    } catch (e) {
      yield SignUpNotLoaded(e.toString());
    }
  }

  Stream<SignUpState> _mapVerifyOtpToState(String body) async* {
    try {
      final response = await authRepository.verifyOtp(body);
      yield OtpVerified(response);
    } catch (e) {
      yield SignUpNotLoaded(e.toString());
    }
  }
}
