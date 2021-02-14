import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:code_blitz/model/repo/home_repository.dart';
import 'package:code_blitz/model/repo/repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'bloc.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final GameRepository gameRepository;
  StreamSubscription _subscription;

  GameBloc({@required this.gameRepository}) : super(GameLoading()) {
    gameRepository.socket.connect();
  }

  @override
  Stream<GameState> mapEventToState(GameEvent event) async* {
    if (event is LoadGame) {
      yield* _mapLoadGameToState();
    }
  }

  Stream<GameState> _mapLoadGameToState() async* {
    try {
      await _subscription?.cancel();
          gameRepository.socket.on('init', (data) => _subscription = Icons.stream)

      yield GameLoaded(response);
    } catch (e) {
      yield GameNotLoaded(e.toString());
    }
  }
}
