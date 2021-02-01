import 'package:bloc/bloc.dart';
import 'package:code_blitz/model/repo/home_repository.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'bloc.dart';

class FriendsBloc extends Bloc<FriendsEvent, FriendsState> {
  final HomeRepository homeRepository;

  FriendsBloc({@required this.homeRepository}) : super(PlayersLoading());

  @override
  Stream<FriendsState> mapEventToState(FriendsEvent event) async* {
    if (event is OpenScreen) {
      yield* _mapSearchQueryChangedToState();
    } else if (event is SearchQueryChanged) {
      yield* _mapSearchQueryChangedToState(keyword: event.keyword);
    } else if (event is TabChanged) {
      yield* _mapSearchQueryChangedToState();
    }
  }

  @override
  Stream<Transition<FriendsEvent, FriendsState>> transformEvents(
      Stream<FriendsEvent> events,
      TransitionFunction<FriendsEvent, FriendsState> transitionFn) {
    final nonDebounceStream = events.where((event) {
      return event is! SearchQueryChanged;
    });

    final debounceStream = events.where((event) {
      return event is SearchQueryChanged;
    }).debounceTime(const Duration(milliseconds: 400));

    return super.transformEvents(
        nonDebounceStream.mergeWith([debounceStream]), transitionFn);
  }


  Stream<FriendsState> _mapSearchQueryChangedToState({String keyword = null}) async* {
    yield PlayersLoading();

    try {
      final response = await homeRepository.getPlayers(keyword: keyword);
      yield PlayersLoaded(response);
    } catch (e) {
      yield PlayersNotLoaded(e.toString());
    }
  }
}
