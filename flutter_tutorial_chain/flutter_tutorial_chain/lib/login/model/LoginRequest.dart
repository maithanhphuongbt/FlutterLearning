

class LoginRequest{
  String userName;
  String password;
  LoginRequest(this.userName, this.password);

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["userName"] = userName;
    map["password"] = password;
    return map;
  }

  Map<String, dynamic> toJson() =>
      {
        'userName': userName,
        'password': password,
      };
}