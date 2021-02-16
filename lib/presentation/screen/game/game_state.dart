import 'package:equatable/equatable.dart';
import 'package:code_blitz/model/api/response/profile_response.dart';

abstract class GameState extends Equatable {
  const GameState();

  @override
  List<Object> get props => [];
}

class GameLoading extends GameState {}

class GameInfo extends GameState {
  final dynamic response;

  const GameInfo(this.response);

  @override
  List<Object> get props {
    return [response];
  }

  @override
  String toString() {
    return 'GameLoaded{response: $response}';
  }
}

class RoundInfo extends GameState {
  final dynamic response;

  const RoundInfo(this.response);

  @override
  List<Object> get props {
    return [response];
  }

  @override
  String toString() {
    return 'GameLoaded{response: $response}';
  }
}

class GameNotLoaded extends GameState {
  final String e;

  const GameNotLoaded(this.e);

  @override
  String toString() {
    return 'GameNotLoaded{e: $e}';
  }
}