import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whats_app_clone_clean_architecture/data/model/user_model.dart';
import '../../data/datasource/firebase_remote_datasource.dart';

import '../../domain/entites/user_entity.dart';

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore fireStore;
  String _verificationId = '';

  FirebaseRemoteDataSourceImpl({
    required this.auth,
    required this.fireStore,
  });

  @override
  Future<void> createUpdateCurrentUser(UserEntity user) async {
    final userCollection = fireStore.collection('user');
    final uid = await getCurrentUId();
    userCollection.doc(uid).get().then((userDoc) {
      final newUser = UserModel(
              name: user.name,
              email: user.email,
              phoneNumber: user.phoneNumber,
              uid: user.uid,
              status: user.status,
              profileUrl: user.profileUrl,
              isOnline: user.isOnline)
          .toDocument();
      if (!userDoc.exists) {
        // create new user
        userCollection.doc(uid).set(newUser);
      } else {
        // update user doc
        userCollection.doc(uid).update(newUser);
      }
    });
  }

  @override
  Future<String> getCurrentUId() async => auth.currentUser!.uid;

  @override
  Future<bool> isSignIn() async {
    final user = auth.currentUser;
    log('user is " ${user?.uid}');
    return user?.uid != null;
  }

  @override
  Future<void> signInWithPhoneNumber(String smsPinCode) async {
    final authCredential = PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: smsPinCode);
    await auth.signInWithCredential(authCredential);
  }

  @override
  Future<void> signOut() async => await auth.signOut();

  @override
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    phoneVerificationCompleted(AuthCredential authCredential) {}
    phoneVerificationFailed(FirebaseAuthException firebaseAuthException) {}
    phoneCodeAutoRetrievalTimeout(String verificationId) {
      _verificationId = verificationId;
    }

    codeSent(String verificationId, [int? forceResendingToken]) {}

    auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: phoneVerificationCompleted,
        verificationFailed: phoneVerificationFailed,
        timeout: const Duration(seconds: 10),
        codeSent: codeSent,
        codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout);
  }
}
