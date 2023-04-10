import '../repositories/firebase_repository.dart';

class SignInWithPhoneNumberUseCase {
  FireBaseRepository repository;

  SignInWithPhoneNumberUseCase({required this.repository});

  Future<void> call(String smsPinCode) async {
     await repository.signInWithPhoneNumber(smsPinCode);
  }
}
