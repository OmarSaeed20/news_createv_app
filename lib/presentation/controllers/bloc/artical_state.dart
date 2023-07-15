part of 'artical_bloc.dart';

abstract class RemoteArticalState extends Equatable {
  const RemoteArticalState({this.article, this.exception});
  final List<ArticleEntity>? article;
  final DioException? exception;

  @override
  List<Object> get props => [article!, exception!];
}

class RemoteArticalInitial extends RemoteArticalState {
  const RemoteArticalInitial();
}

class RemoteArticalLoading extends RemoteArticalState {
  const RemoteArticalLoading();
}

class RemoteArticalDone extends RemoteArticalState {
  const RemoteArticalDone(List<ArticleEntity> article)
      : super(article: article);
}

class RemoteArticalException extends RemoteArticalState {
  const RemoteArticalException(DioException exception)
      : super(exception: exception);
}
