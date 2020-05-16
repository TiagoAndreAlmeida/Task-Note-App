import 'package:mobx/mobx.dart';
import 'package:task_app/models/user.dart';
import 'package:task_app/services/services.dart';
part 'user.store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  Services services = new Services();  

  @observable
  User user = new User(name: '', email: '', password: '', photo: '');

  @action
  void setUserName(String value) => user.name = value;

  @action
  void setUserEmail(String value) => user.email = value;

  @action
  void setUserPassword(String value) => user.password = value;

  @action
  void submit(){
    services.userResgister(user);
  }
}