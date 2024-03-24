import 'dart:io';
import 'package:flawlessly/utils/endpoints.dart';
import 'package:flawlessly/utils/utils.dart';
import 'package:http/http.dart' as http;

class Result<Success, Err> {
  Success? success;
  Err? error;

  Result({this.success, this.error});
}

class NetworkUtils {
  static Future<Result<Success, Error>> fetch<Success>(
    Endpoint endpoint,
    Success Function(dynamic s) fromJson, {
    Map<String, String>? queryParams = const <String, String>{},
  }) async {
    print("http: call to ${endpoint.endpoint} started");
    try {
      String finalUrl = queryParams == null
          ? endpoint.endpoint
          : endpoint.endpoint + queryParams.enqueueQueryParams();

      final response = await http.get(
        Uri.parse(finalUrl),
      );

      switch (response.statusCode) {
        case != 200:
          print("http: call to $finalUrl error");
          throw HttpException('${response.statusCode}');
        default:
          return Result(
            success: fromJson(response.body),
          );
      }
    } on SocketException {
      print('No Internet connection 😑');
      return Result(
        error: Error(),
      );
    } on HttpException {
      print("Couldn't find 😱");
      return Result(
        error: Error(),
      );
    } on FormatException {
      print("Bad response format 👎");
      return Result(
        error: Error(),
      );
    }
  }
}
