import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class NumberChanged extends SignUpEvent {
  final String phone;

  const NumberChanged({@required this.phone});

  @override
  List<Object> get props => [phone];

  @override
  String toString() {
    return 'NumberChanged{phone: $phone}';
  }
}

class SendOtp extends SignUpEvent {
  final String phone;

  const SendOtp({this.phone});

  @override
  List<Object> get props => [phone];

  @override
  String toString() {
    return 'SendOtp{phone: $phone}';
  }
}

class VerifyOtp extends SignUpEvent {
  final String body;

  const VerifyOtp({this.body});

  @override
  List<Object> get props => [body];

  @override
  String toString() {
    return 'VerifyOtp{phone: $body}';
  }
}
