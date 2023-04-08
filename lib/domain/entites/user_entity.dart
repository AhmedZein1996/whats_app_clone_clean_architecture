import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String email;
  final String phoneNumber;
  final String uid;
  final String status;
  final String profileUrl;
  final bool isOnline;

  const UserEntity({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.uid,
     this.status = 'Hello there i\'m using this app',
    required this.profileUrl,
    required this.isOnline,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [name, email, phoneNumber, uid, status, profileUrl, isOnline];
}
