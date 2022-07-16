class CreateUserModel {
  CreateUserModel({
    required this.createUser,
  });

  final CreateUser createUser;

  factory CreateUserModel.fromJson(Map<String, dynamic> json) =>
      CreateUserModel(
        createUser: CreateUser.fromJson(json["createUser"]),
      );

  Map<String, dynamic> toJson() => {
        "createUser": createUser.toJson(),
      };
}

class CreateUser {
  CreateUser({
    required this.user,
  });

  final User user;

  factory CreateUser.fromJson(Map<String, dynamic> json) => CreateUser(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
