import 'package:code_blitz/model/repo/home_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'bloc.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final HomeRepository homeRepository;

  DashboardBloc({@required this.homeRepository}) : super(DefaultState());

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    if (event is CreateMatch) {
      yield MatchLoading();
      yield* _mapLoadDashboardToState();
    } else if (event is JoinMatch) {
      yield MatchLoading();
      yield* _mapLoadDashboardToState(event.code);
    }
  }

  Stream<DashboardState> _mapLoadDashboardToState([String code]) async* {
    try {
      final response = await homeRepository.getProfileData();

      yield MatchLoaded(response);
    } catch (e) {
      yield MatchNotLoaded(e.toString());
    }
  }
}
