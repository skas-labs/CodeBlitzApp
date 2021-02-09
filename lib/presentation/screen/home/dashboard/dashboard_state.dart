import 'package:equatable/equatable.dart';
import 'package:code_blitz/model/api/response/profile_response.dart';
import 'package:retrofit/dio.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DefaultState extends DashboardState {}

class MatchLoading extends DashboardState {}

class MatchLoaded extends DashboardState {
  final Map response;

  const MatchLoaded(this.response);

  @override
  List<Object> get props {
    return [response];
  }

  @override
  String toString() {
    return 'MatchLoaded{response: $response}';
  }
}

class MatchNotLoaded extends DashboardState {
  final String e;

  const MatchNotLoaded(this.e);

  @override
  String toString() {
    return 'MatchNotLoaded{e: $e}';
  }
}