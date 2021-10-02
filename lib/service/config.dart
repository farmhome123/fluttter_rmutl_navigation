import 'dart:io';
import 'package:http/http.dart' as http;

class connect {
  String url = 'api.rmutlfarm.tk';
  String urlimage = "https://api.rmutlfarm.tk/";
  var header = {HttpHeaders.contentTypeHeader: "application/json"};

  // Future<http.Response> post(String router, [dynamic data]) async {
  //   return http.post(url + router, body: data, headers: header);
  // }

  Future<http.Response> get(router) {
    return http.get(Uri.https(url, router), headers: header);
  }

  // Future<http.Response> delete(router) {
  //   return http.delete(url + router, headers: header);
  // }

  // Future<http.Response> put(router, data) {
  //   return http.put(url + router, headers: header, body: data);
  // }
}
