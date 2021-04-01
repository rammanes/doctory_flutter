
class LoginResponse {
  LoginResponse({
    this.data,
    this.public,
  });

  Data data;
  bool public;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    data: Data.fromJson(json["data"]),
    public: json["public"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "public": public,
  };
}

class Data {
  Data({
    this.token,
    this.user,
  });

  String token;
  User user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user.toJson(),
  };
}

class User {
  User({
    this.id,
    this.status,
    this.role,
    this.firstName,
    this.lastName,
    this.email,
    this.timezone,
    this.locale,
    this.localeOptions,
    this.avatar,
    this.phone,
    this.company,
    this.title,
    this.smsNotification,
    this.webNotification,
    this.externalId,
    this.theme,
    this.the2FaSecret,
    this.passwordResetToken,
    this.confirmEmailToken,
  });

  String id;
  String status;
  String role;
  String firstName;
  String lastName;
  String email;
  String timezone;
  dynamic locale;
  dynamic localeOptions;
  String avatar;
  String phone;
  dynamic company;
  dynamic title;
  String smsNotification;
  String webNotification;
  String externalId;
  String theme;
  dynamic the2FaSecret;
  dynamic passwordResetToken;
  dynamic confirmEmailToken;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    status: json["status"],
    role: json["role"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    timezone: json["timezone"],
    locale: json["locale"],
    localeOptions: json["locale_options"],
    avatar: json["avatar"],
    phone: json["phone"],
    company: json["company"],
    title: json["title"],
    smsNotification: json["sms_notification"],
    webNotification: json["web_notification"],
    externalId: json["external_id"],
    theme: json["theme"],
    the2FaSecret: json["2fa_secret"],
    passwordResetToken: json["password_reset_token"],
    confirmEmailToken: json["confirm_email_token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "role": role,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "timezone": timezone,
    "locale": locale,
    "locale_options": localeOptions,
    "avatar": avatar,
    "phone": phone,
    "company": company,
    "title": title,
    "sms_notification": smsNotification,
    "web_notification": webNotification,
    "external_id": externalId,
    "theme": theme,
    "2fa_secret": the2FaSecret,
    "password_reset_token": passwordResetToken,
    "confirm_email_token": confirmEmailToken,
  };
}
