abstract class ApiRequest {
  String method();
  String endpoint();
  Map<String, dynamic> query();
  dynamic body();
}
