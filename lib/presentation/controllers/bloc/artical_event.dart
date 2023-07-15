part of 'artical_bloc.dart';

abstract class RemoteArticalEvent extends Equatable {
  const RemoteArticalEvent();

  @override
  List<Object> get props => [];
}

class GetArticlesEvent extends RemoteArticalEvent {}
