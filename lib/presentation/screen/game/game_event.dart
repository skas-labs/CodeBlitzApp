import 'package:equatable/equatable.dart';

class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

class LoadGame extends GameEvent {
  final int id;

  const LoadGame(this.id);

  @override
  List<Object> get props => [id];

  @override
  String toString() {
    return 'LoadGame{id: $id}';
  }
}

