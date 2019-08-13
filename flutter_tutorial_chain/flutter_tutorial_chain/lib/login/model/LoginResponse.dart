
class LoginResponse {
  String status;
  String message;

  LoginResponse({
    this.status,
    this.message
  });

  LoginResponse.fromMap(Map<String, dynamic> map) {
    status = map['status'];
    message = map['message'];
  }

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
      message: json['message']
    );
  }
}

