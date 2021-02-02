import 'package:equatable/equatable.dart';

class PlayerEvent extends Equatable {
  const PlayerEvent();

  @override
  List<Object> get props => [];
}

class LoadPlayer extends PlayerEvent {
  final int id;

  const LoadPlayer(this.id);

  @override
  List<Object> get props => [id];

  @override
  String toString() {
    return 'LoadPlayer{id: $id}';
  }
}

class RefreshPlayer extends PlayerEvent {}