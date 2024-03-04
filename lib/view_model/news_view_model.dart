import 'package:news_app/models/CategoriesNewsModel.dart';
import 'package:news_app/models/NewsChannelHeadlinesModel.dart';
import 'package:news_app/repository/news_repository.dart';

class NewsViewModel {
  final _repo = NewsRepository();


  Future<NewsChannelsHeadlinesModel> fetchNewsChannelHeadlinesApi(
      String ChannelName) async {
    final response = await _repo.fetchNewsChannelHeadlinesApi(ChannelName);
    return response;
  }

  Future<CategoriesNewsModel> fetchCatogiresNewsApi(String category) async {
    final response = await _repo.fetchCatogiresNewsApi(category);
    return response;
  }
}
