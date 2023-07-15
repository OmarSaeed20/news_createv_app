import 'package:news_createv_app/app/core/resources/data_state.dart';
import 'package:news_createv_app/app/core/usecase/usecase.dart';
import 'package:news_createv_app/domain/entites/article.dart';

import '../repository/get_article.dart';

class GetArticleUseCase extends UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _repository;

  GetArticleUseCase(this._repository);
  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _repository.getNewsArticles();
  }
}
