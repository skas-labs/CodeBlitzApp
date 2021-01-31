import 'package:equatable/equatable.dart';
import 'package:retrofit/retrofit.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class DefaultState extends SignUpState {}

class SignUpLoaded extends SignUpState {
  final String response;

  const SignUpLoaded(this.response);

  @override
  List<Object> get props {
    return [response];
  }

  @override
  String toString() {
    return 'SignUpLoaded{response: $response}';
  }
}

class SignUpNotLoaded extends SignUpState {
  final String e;

  const SignUpNotLoaded(this.e);

  @override
  String toString() {
    return 'SignUpNotLoaded{e: $e}';
  }
}