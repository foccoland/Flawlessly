import 'package:flawlessly/model/news_everything_response_model.dart';
import 'package:flawlessly/service/service.dart';
import 'package:flawlessly/utils/network.dart';

class NewsRepository {
  late ApiService service;

  NewsRepository() {
    service = ApiService();
  }

  Future<Result<NewsEverythingResponse?, Error>> fetchNews() async =>
      await service.fetchNews();
}
