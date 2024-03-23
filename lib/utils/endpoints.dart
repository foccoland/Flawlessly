import 'constants.dart';

enum Endpoint {
  everything(endpoint: "$baseUrl/v2/everything");

  final String endpoint;
  const Endpoint({required this.endpoint});
}
