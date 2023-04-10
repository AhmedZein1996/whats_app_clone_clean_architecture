import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String name,
    required String email,
    required String phoneNumber,
    required String uid,
    required String status,
    required String profileUrl,
    required bool isOnline,
  }) : super(
            name: name,
            email: email,
            phoneNumber: phoneNumber,
            uid: uid,
            status: status,
            profileUrl: profileUrl,
            isOnline: isOnline);

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final snapShotData = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      name: snapShotData['name'],
      email: snapShotData['email'],
      phoneNumber: snapShotData['phoneNumber'],
      uid: snapShotData['uid'],
      status: snapShotData['status'],
      profileUrl: snapShotData['profileUrl'],
      isOnline: snapShotData['isOnline'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'uid': uid,
      'status': status,
      'profileUrl': profileUrl,
      'isOnline': isOnline,
    };
  }
}
