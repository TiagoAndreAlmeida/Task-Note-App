import 'package:http/http.dart' as http;
import 'package:task_app/models/user.dart';
import 'package:task_app/utils/utils.dart';

class Services {
  Future userResgister(User user) async {
    Map<String, dynamic> data = user.toJson();
    final response = await http.post('$URL/user_profile/',
      body: data
    );
    return response;
  }

  Future userLogin(String email, String password) async {
    Map<String, String> data = {
      "username": email,
      "password": password
    };
    final response = await http.post('$URL/auth_login/', 
      body: data
    );
    return response;
  }
}