import 'dart:io' show HttpStatus;
import 'package:flutter/material.dart';
import 'package:news_createv_app/app/core/resources/data_state.dart';
import 'package:news_createv_app/data/model/article_model.dart';
import 'package:dio/dio.dart';

import 'package:news_createv_app/domain/entites/article.dart';
import 'package:news_createv_app/data/data_sorce/news_api_serves.dart';

import '../../domain/repository/get_article.dart';
import '../error_handler.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsApiService(
        apikey: newsAPIKey,
        category: categoryQuery,
        country: countryQuery,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
              error: httpResponse.response.statusMessage,
              response: httpResponse.response,
              type: DioExceptionType.badResponse,
              requestOptions: httpResponse.response.requestOptions),
        );
      }
    } on DioException catch (e) {
      debugPrint(
          '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>DioException catch <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
      throw DioExceptions.fromDioError(
              dioException: e, errorFrom: "getProfileData")
          .errorMessage();
      /* return DataFailed(
        DioException(
          error: e.response?.statusMessage,
          response: e.response,
          type: e.type,
          requestOptions: e.requestOptions,
        ),
      ); */
      // return DataFailed(e);
    }
  }

  @override
  Future<List<ArticleModel>> getSavedArticles() {
    // TODO: implement getSavedArticles
    throw UnimplementedError();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
    // TODO: implement removeArticle
    throw UnimplementedError();
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
    // TODO: implement saveArticle
    throw UnimplementedError();
  }
}
