import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class User {
  final String? id;
  final String? username;
  final String? password;

  User({
    this.id,
    this.username,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  static final User fakeUser = User(
    username: 'hien123',
    password: '1234',
  );
}
