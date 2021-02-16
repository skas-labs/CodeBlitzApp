import 'package:equatable/equatable.dart';

class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

class LoadGame extends GameEvent {
  final String id;

  const LoadGame(this.id);

  @override
  List<Object> get props => [id];

  @override
  String toString() {
    return 'LoadGame{id: $id}';
  }
}

class GameLoaded extends GameEvent {
  final dynamic res;

  const GameLoaded(this.res);

  @override
  List<Object> get props => [res];

  @override
  String toString() {
    return 'GameLoaded{res: $res}';
  }
}

class RoundStart extends GameEvent {
  final dynamic res;

  const RoundStart(this.res);

  @override
  List<Object> get props => [res];

  @override
  String toString() {
    return 'RoundStart{res: $res}';
  }
}


