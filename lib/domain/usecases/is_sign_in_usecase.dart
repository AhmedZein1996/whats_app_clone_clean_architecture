import '../repositories/firebase_repository.dart';

class IsSignInUseCase{
  final FireBaseRepository repository;

  IsSignInUseCase({required this.repository});

  Future<bool> call() async{
   return await repository.isSignIn();
  }
}