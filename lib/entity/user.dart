import "dart:convert";

class User {
  int id_user;
  int id_role;
  String image_profile;
  String nama;
  String email;
  String username;
  String password;
  DateTime tanggal_lahir;
  String no_telp;
  String verify_key;
  int active;
  DateTime email_verified_at;
  String remember_token;
  DateTime created_at;
  DateTime update_at;
  

  User({
    required this.id_user,
    required this.id_role,
    required this.image_profile,
    required this.nama,
    required this.email,
    required this.username,
    required this.password,
    required this.tanggal_lahir,
    required this.no_telp,
    required this.verify_key,
    required this.active,
    required this.email_verified_at,
    required this.remember_token,
    required this.created_at,
    required this.update_at,
  });

  factory User.fromrawJson(String str) => User.fromrawJson(json.decode(str));
  factory User.fromJson(Map<String, dynamic> json) => User(
        id_user: json["id_user"],
        id_role: json["id_role"],
        image_profile: json["image_profile"],
        nama: json["nama"],
        email: json["email"],
        username: json["username"],
        password: json["password"],
        tanggal_lahir: DateTime.parse(json["tanggal_lahir"]),
        no_telp: json["no_telp"],
        verify_key: json["verify_key"],
        active: json["active"],
        email_verified_at: DateTime.parse(json["email_verified_at"]),
        remember_token: json["remember_token"],
        created_at: DateTime.parse(json["created_at"]),
        update_at: DateTime.parse(json["update_at"]),
      );

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
        "id_user": id_user,
        "id_role": id_role,
        "image_profile": image_profile,
        "nama": nama,
        "email": email,
        "username": username,
        "password": password,
        "tanggal_lahir": tanggal_lahir.toIso8601String(),
        "no_telp": no_telp,
        "verify_key": verify_key,
        "active": active,
        "email_verified_at": email_verified_at.toIso8601String(),
        "remember_token": remember_token,
        "created_at": created_at.toIso8601String(),
        "update_at": update_at.toIso8601String(),
      };
}
