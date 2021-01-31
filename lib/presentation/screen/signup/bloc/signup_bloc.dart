import 'package:bloc/bloc.dart';
import 'package:code_blitz/model/repo/auth_repository.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepository;

  SignUpBloc({@required this.authRepository}) : super(DefaultState());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SendOtp) {
      yield* _mapSendOtpToState(event.phone);
    } else if (event is VerifyOtp) {
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
      await _saveAccessToken(response.substring(10,30));
      yield OtpVerified(response);
    } catch (e) {
      yield SignUpNotLoaded(e.toString());
    }
  }

  Future<void> _saveAccessToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', token);
  }
}
