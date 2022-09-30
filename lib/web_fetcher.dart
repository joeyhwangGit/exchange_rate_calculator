import 'package:http/http.dart' as http;

class WebFetcher {
  static const _maxTry = 4;

  static Future<http.Response> _getResponse(String page) async {
    return await http.get(Uri.parse(page), headers: {
      "Access-Control-Allow-Origin": "*",
      'Access-Control-Allow-Credentials': 'true',
      'Accept': '*/*'
    });
  }

  static Future<http.Response> getPage(String page) async {
    http.Response response;
    int nTry = 0;
    do {
      response = await _getResponse(page);
      nTry++;
    } while (response.statusCode != 200 && nTry < _maxTry);

    return response;
  }
}
