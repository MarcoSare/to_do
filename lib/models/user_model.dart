class UserModel {
  int? id;
  String? state;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? gender;
  bool? isAdmin;
  String? profilePicture;
  String? token;

  UserModel(
      {this.id,
      this.state,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.gender,
      this.isAdmin,
      this.profilePicture,
      this.token});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        id: int.parse(map["id"]),
        firstName: map["first_name"],
        lastName: map["last_name"],
        email: map["email"],
        profilePicture: map["profile_picture"],
        isAdmin: int.parse(map["is_admin"]) == 1 ? true : false,
        token: map["token"]);
  }
}
