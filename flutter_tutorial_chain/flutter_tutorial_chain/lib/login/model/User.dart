class User {
  String id, name, address, phone, email, userName, password;

  User({
    this.id,
    this.name,
    this.address,
    this.phone,
    this.email,
    this.userName,
    this.password,
  });

  User.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    address = map['address'];
    phone = map['phone'];
    email = map['email'];
    userName = map['userName'];
    password = map['password'];
  }
}