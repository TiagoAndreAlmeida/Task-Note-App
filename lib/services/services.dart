import 'package:http/http.dart' as http;
import 'package:task_app/models/user.dart';
import 'package:task_app/utils/utils.dart';

class Services {

  Future userResgister(User user) async {
    print("Chamou API");
    final response = await http.post('$URL/user_profile/',
      body: user.toJson()
    );
    if(response.statusCode == 200) {
      print(response.body);
    } else {
    }
  }
}