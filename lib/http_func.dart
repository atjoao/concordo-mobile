import "package:http/http.dart" as http;

class HttpFunc {
  final String baseURL = "https://concordo_back.joao.lol";

  Future<http.Response> createRequest(String endpoint, String method,
      Map<String, String>? headers, Object? body) async {
    final Uri uri = Uri.parse('$baseURL/$endpoint');
    http.Response res;

    switch (method.toUpperCase()) {
      case "PATCH":
        {
          res = await http.patch(uri);
          break;
        }

      case "DELETE":
        {
          res = await http.delete(uri);
          break;
        }

      case "POST":
        {
          res = await http.post(uri);
          break;
        }

      case "GET":
      default:
        {
          res = await http.get(uri);
          break;
        }
    }

    return res;
  }
}
