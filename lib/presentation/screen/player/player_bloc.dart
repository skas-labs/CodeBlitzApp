import 'package:code_blitz/model/repo/home_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'bloc.dart';


class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final HomeRepository homeRepository;

  PlayerBloc({@required this.homeRepository}) : super(PlayerLoading());
  int playerId;
  @override
  Stream<PlayerState> mapEventToState(PlayerEvent event) async* {
    if (event is LoadPlayer) {
      playerId = event.id;
      yield* _mapLoadPlayerToState();
    } else if (event is RefreshPlayer) {
      yield PlayerLoading();
      yield* _mapLoadPlayerToState();
    }
  }

  Stream<PlayerState> _mapLoadPlayerToState() async* {
    try {
      final response = await homeRepository.getPlayer(playerId);

      yield PlayerLoaded(response);
    } catch (e) {
      yield PlayerNotLoaded(e.toString());
    }
  }
}
