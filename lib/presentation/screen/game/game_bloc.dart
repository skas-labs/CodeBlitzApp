import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:code_blitz/model/repo/repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'bloc.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final GameRepository gameRepository;

  GameBloc({@required this.gameRepository}) : super(GameLoading()) {
    gameRepository.makeConnection();
    gameRepository.on('init', (data) => add(GameLoaded(data)));
    gameRepository.on('player_joined',
        (data) => {add(GameLoaded(data)), gameRepository.emit('start')});
    gameRepository.on('question_result', (data) => add(GameLoaded(data)));
    gameRepository.on('round_start', (data) => add(RoundStart(data)));
    gameRepository.on('game_error', (data) => add(GameLoaded(data)));
    gameRepository.emit('join');
  }

  @override
  Stream<GameState> mapEventToState(GameEvent event) async* {
    if (event is GameLoaded) {
      yield GameInfo(event.res);
    }
    else if (event is RoundStart) {
      yield RoundInfo(event.res);
    }else {
      yield const GameNotLoaded("Error");
    }
  }

  Stream<GameState> _mapLoadGameToState() async* {}
}
