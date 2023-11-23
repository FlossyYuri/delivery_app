import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> postRequest(
    String endpoint, Map<String, dynamic> body) async {
  var url = Uri.https('ergo.flossyyuri.com', '/api/v1/$endpoint');

  var response = await http.post(url, body: body);
  print(url.toString());
  print(response.statusCode);
  var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
  return {'statusCode': response.statusCode, 'jsonResponse': jsonResponse};
}
