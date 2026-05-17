import 'package:track_expense/src/features/auth/domain/entities/user.dart';

class AppUserModel extends AppUser {
  const AppUserModel({
    required super.id,
    required super.email,
    super.name,
    super.photoUrl,
  });

  factory AppUserModel.fromMap(Map<String, dynamic> map) {
    final data = map['user'] is Map<String, dynamic>
        ? map['user'] as Map<String, dynamic>
        : map;

    return AppUserModel(
      id: (data['id'] ?? '').toString(),
      email: (data['email'] ?? '').toString(),
      name: data['name'] as String?,
      photoUrl: data['photoUrl'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      if (name != null) 'name': name,
      if (photoUrl != null) 'photoUrl': photoUrl,
    };
  }

  AppUser toEntity() {
    return AppUser(
      id: id,
      email: email,
      name: name,
      photoUrl: photoUrl,
    );
  }
}
