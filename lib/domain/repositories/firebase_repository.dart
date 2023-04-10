import '../../domain/entites/user_entity.dart';

abstract class FireBaseRepository {

  Future<void> verifyPhoneNumber(String phoneNumber);

  Future<void> signInWithPhoneNumber(String smsPinCode);

  Future<bool> isSignIn();

  Future<void> signOut();

  Future<String> getCurrentUId();

  Future<void> createUpdateCurrentUser(UserEntity user);
}
