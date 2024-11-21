import 'user_details.dart';

class LoginModel {
  bool? status;
  String? message;
  String? token;
  bool? isSuperuser;
  UserDetails? userDetails;

  LoginModel({
    this.status,
    this.message,
    this.token,
    this.isSuperuser,
    this.userDetails,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        token: json['token'] as String?,
        isSuperuser: json['is_superuser'] as bool?,
        userDetails: json['user_details'] == null
            ? null
            : UserDetails.fromJson(
                json['user_details'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'token': token,
        'is_superuser': isSuperuser,
        'user_details': userDetails?.toJson(),
      };
}
