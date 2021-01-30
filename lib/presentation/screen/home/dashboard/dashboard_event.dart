import 'package:equatable/equatable.dart';

class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class OpenScreen extends DashboardEvent {}

class JoinMatch extends DashboardEvent {
  final String code;

  JoinMatch({this.code});

  @override
  List<Object> get props => [code];

  @override
  String toString() {
    return 'JoinMatchCode{code: $code}';
  }
}

class CreateMatch extends DashboardEvent {}