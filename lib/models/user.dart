class User {
  int id;
  String name;
  String email;
  String password;
  String photo;

  User({
    this.name,
    this.email,
    this.password,
    this.photo,
    this.id=0
  });

  //serializers
  User.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.email = json['email'];
    this.photo = json['photo'];
    this.id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['photo'] = this.photo;
    return data;
  }
}