import 'package:flawlessly/utils/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:flawlessly/model/news_everything_response_model.dart';
import '../utils/network.dart';

class ApiService {
  Future<Result<Success, Error>> fetch<Success>(
    Endpoint endpoint,
    Success Function(dynamic s) fromJson,
  ) async {
    try {
      dynamic response = await http.get(
        Uri.parse(endpoint.endpoint),
      );
      return Result(
        success: fromJson(response),
      );
    } catch (e) {
      return Result(
        error: Error(),
      );
    }
  }

  Future<Result<NewsEverythingResponse, Error>> fetchNews() async =>
      await fetch(
        Endpoint.everything,
        (s) => newsEverythingResponseFromJson(s),
      );

  Future<NewsEverythingResponse?> fetchNews2() async {
    Result<NewsEverythingResponse, Error> result = await fetchNews();
    if (result.success != null) {
      return result.success;
    }
    return null;
  }
}
