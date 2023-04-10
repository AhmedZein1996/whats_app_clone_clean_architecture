import 'package:whats_app_clone_clean_architecture/data/datasource/firebase_remote_datasource.dart';

import '../../domain/entites/user_entity.dart';
import '../../domain/repositories/firebase_repository.dart';

class FireBaseRepositoryIml implements FireBaseRepository{
  FirebaseRemoteDataSource remoteDataSource;

  FireBaseRepositoryIml({required this.remoteDataSource});

  @override
  Future<void> createUpdateCurrentUser(UserEntity user) async{
     await remoteDataSource.createUpdateCurrentUser(user);
  }

  @override
  Future<String> getCurrentUId() async{
    return await remoteDataSource.getCurrentUId();
  }

  @override
  Future<bool> isSignIn() async{
    return await remoteDataSource.isSignIn();
  }

  @override
  Future<void> signInWithPhoneNumber(String smsPinCode) async{
      await remoteDataSource.signInWithPhoneNumber(smsPinCode);
  }

  @override
  Future<void> signOut()async {
       await remoteDataSource.signOut();
  }

  @override
  Future<void> verifyPhoneNumber(String phoneNumber) async{
       await remoteDataSource.verifyPhoneNumber(phoneNumber);
  }

}