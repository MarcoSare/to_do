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

  UserModel(
      {this.id,
      this.state,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.gender,
      this.isAdmin,
      this.profilePicture});
}
