class AuthModel {
  String? email;
  String? password;
  String? name;
  String? type;

  AuthModel({this.email, this.password, this.name, this.type});

  AuthModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['name'] = this.name;
    data['type'] = this.type;
    return data;
  }
}
