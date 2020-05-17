import 'package:http/http.dart' as http;
import 'package:task_app/models/user.dart';
import 'package:task_app/utils/utils.dart';

class Services {

  Future userResgister(User user) async {
    print("Chamou API");
    Map<String, dynamic> data = user.toJson();
    Object _user = {
      "email": user.email,
      "password": user.password
    };
    data['user'] = _user;
    final response = await http.post('$URL/user_profile/',
      body: data
    );
    return response;
  }
}