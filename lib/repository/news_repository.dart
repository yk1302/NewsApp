import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/CategoriesNewsModel.dart';
import 'package:news_app/models/NewsChannelHeadlinesModel.dart';

class NewsRepository {

  Future<NewsChannelsHeadlinesModel> fetchNewsChannelHeadlinesApi(
      String ChannelName) async {
    String uri =
        "https://newsapi.org/v2/top-headlines?sources=${ChannelName}&apiKey=b9584e50d57d456691dfd091f61f414e";

    final response = await http.get(Uri.parse(uri));
    print(response.body);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return NewsChannelsHeadlinesModel.fromJson(body);
    }
    throw Exception('Error');
  }

  Future<CategoriesNewsModel> fetchCatogiresNewsApi(String category) async {
    String uri =
        "https://newsapi.org/v2/everything?q=${category}&apiKey=b9584e50d57d456691dfd091f61f414e";
    final response = await http.get(Uri.parse(uri));
    print(response.body);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return CategoriesNewsModel.fromJson(body);
    }
    throw Exception('Error');
  }
}
