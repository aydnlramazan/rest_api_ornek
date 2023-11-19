// ignore_for_file: file_names, avoid_print
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:rest_api_ornek/constants.dart';
import 'package:rest_api_ornek/model/user_model.dart';

class ApiService {
  Future<List<UserModel>?> getUser() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndPoint);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<UserModel> model = userModelFromJson(response.body);
        print(model);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
