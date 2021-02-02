import 'package:equatable/equatable.dart';
import 'package:code_blitz/model/api/response/profile_response.dart';

abstract class PlayerState extends Equatable {
  const PlayerState();

  @override
  List<Object> get props => [];
}

class PlayerLoading extends PlayerState {}

class PlayerLoaded extends PlayerState {
  final ProfileResponse response;

  const PlayerLoaded(this.response);

  @override
  List<Object> get props {
    return [response];
  }

  @override
  String toString() {
    return 'PlayerLoaded{response: $response}';
  }
}

class PlayerNotLoaded extends PlayerState {
  final String e;

  const PlayerNotLoaded(this.e);

  @override
  String toString() {
    return 'PlayerNotLoaded{e: $e}';
  }
}