import 'package:flawlessly/utils/endpoints.dart';
import 'package:flawlessly/model/news_everything_response_model.dart';
import '../utils/constants.dart' as Constants;
import '../utils/network.dart';

class ApiService {
  Future<Result<NewsEverythingResponse, Error>> fetchNews() async =>
      await NetworkUtils.fetch(
          Endpoint.everything, (s) => newsEverythingResponseFromJson(s),
          queryParams: {"q": "ethereum", "apiKey": Constants.apiKey});
}
