import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:news_createv_app/domain/entites/article.dart';
import 'package:news_createv_app/domain/usecase/get_article_usecase.dart';

import '../../../app/core/resources/data_state.dart';

part 'artical_event.dart';
part 'artical_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticalEvent, RemoteArticalState> {
  final GetArticleUseCase _useCase;
  RemoteArticleBloc(this._useCase) : super(const RemoteArticalInitial()) {
    on<GetArticlesEvent>(onGetArticles);
  }
  void onGetArticles(
      GetArticlesEvent event, Emitter<RemoteArticalState> emit) async {
    emit(const RemoteArticalLoading());
    final dataState = await _useCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticalDone(dataState.data!));
    }
    debugPrint("Error state message>>>>>>>>> ?");
    debugPrint("Error state message>>>>>>>>>?? ${state.exception!.message}");
    if (dataState is DataFailed) {
      debugPrint("Error state message>>>>>>>>>1 ${state.exception!.message}");
      debugPrint("Error dataState.error >>>>>>>>> ${dataState.error!.message}");
      emit(RemoteArticalException(dataState.error!));
    }
  }
}
