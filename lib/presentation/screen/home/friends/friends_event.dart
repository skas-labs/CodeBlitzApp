import 'package:equatable/equatable.dart';

class FriendsEvent extends Equatable {
  const FriendsEvent();

  @override
  List<Object> get props => [];
}

class OpenScreen extends FriendsEvent {}


class TabChanged extends FriendsEvent {
  final int index;

  const TabChanged({this.index});

  @override
  List<Object> get props => [index];

  @override
  String toString() {
    return 'TabChanged{index: $index}';
  }
}

class SearchQueryChanged extends FriendsEvent {
  final String keyword;

  const SearchQueryChanged({this.keyword});

  @override
  List<Object> get props => [keyword];

  @override
  String toString() {
    return 'SearchQueryChanged{keyword: $keyword}';
  }
}
