import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon_app/core/enviroment_config.dart';

class HttpManager {
  Future<dynamic> get(url, {String token}) async {
    final response = await http.Client().get(
      EnvironmentConfig.apiUrl + url,
      headers: token != null
          ? {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            }
          : null,
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      print("Algo salio mal");
      throw new Exception("Revisa el Api");
    }
    final parsed = jsonDecode(response.body);

    return parsed;
  }

  Future<dynamic> post(url, {data, String token}) async {
    final params = jsonEncode(data);

    final response = await http.Client().post(
      EnvironmentConfig.apiUrl + url,
      body: params != null ? params : null,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      print("Algo salio mal");
      return null;
    }

    final parsed = jsonDecode(response.body);
    //print(parsed);
    final success = parsed["status"];

    if (!success) {
      throw new Exception(parsed["message"]);
    }

    return parsed;
  }
}
