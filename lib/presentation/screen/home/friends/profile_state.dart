import 'package:equatable/equatable.dart';
import 'package:code_blitz/model/api/response/profile_response.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileResponse response;

  const ProfileLoaded(this.response);

  @override
  List<Object> get props {
    return [response];
  }

  @override
  String toString() {
    return 'ProfileLoaded{response: $response}';
  }
}

class ProfileNotLoaded extends ProfileState {
  final String e;

  const ProfileNotLoaded(this.e);

  @override
  String toString() {
    return 'ProfileNotLoaded{e: $e}';
  }
}