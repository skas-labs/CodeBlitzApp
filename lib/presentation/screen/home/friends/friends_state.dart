import 'package:code_blitz/model/api/response/profile_response.dart';
import 'package:equatable/equatable.dart';

abstract class FriendsState extends Equatable {
  const FriendsState();

  @override
  List<Object> get props => [];
}

class PlayersLoading extends FriendsState {}

class PlayersLoaded extends FriendsState {
  final List<ProfileResponse> response;

  const PlayersLoaded(this.response);

  @override
  List<Object> get props {
    return [response];
  }

  @override
  String toString() {
    return 'PlayersLoaded{response: $response}';
  }
}

class PlayersNotLoaded extends FriendsState {
  final String e;

  const PlayersNotLoaded(this.e);

  @override
  String toString() {
    return 'PlayersNotLoaded{e: $e}';
  }
}
