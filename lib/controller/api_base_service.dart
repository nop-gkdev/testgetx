import 'dart:convert';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:testgetx/controller/endpoints.dart';

class ServiceRequest extends GetxController {
  Future<dynamic> get(
      {String? path,
      Map<String, String>? headders,
      Map<String, dynamic>? queryParameters}) async {
    try {
      Uri uri = Uri(
          scheme: 'https',
          host: Endpoints.host,
          path: path,
          queryParameters: queryParameters);
      var res = await http.get(uri, headers: headders!);
      final result = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return result;
      } else {
        var message = result['message'];
        throw (message);
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<dynamic> getApi(
      {String? path,
      Map<String, String>? headders,
      String? query,
      Map<String, dynamic>? queryParameters}) async {
    try {
      Uri uri = Uri(
        scheme: 'https',
        host: Endpoints.groofHostUrl,
        path: path,
        query: query,
      );
      var res = await http.get(uri, headers: headders!);
      final result = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return result;
      } else {
        var message = result['message'];
        throw (message);
      }
    } catch (e) {
      throw (e.toString());
    }
  }
}
