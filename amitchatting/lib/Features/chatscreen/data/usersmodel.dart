// ignore_for_file: public_member_api_docs, sort_constructors_first
class UsersModel {
  String? email;
  String? password;
  String? token;
  UsersModel({
    this.email,
    this.password,
    this.token,
  });
  factory UsersModel.fromJson(jsonData) {
    return UsersModel(
        email: jsonData['email'],
        password: jsonData['password'],
        token: jsonData['token']);
  }
}
