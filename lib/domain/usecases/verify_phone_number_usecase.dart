import '../repositories/firebase_repository.dart';

class VerifyPhoneNumberUseCase{
  final FireBaseRepository repository;

  VerifyPhoneNumberUseCase({required this.repository});

  Future<void> call(String phoneNumber) async{
   await repository.verifyPhoneNumber(phoneNumber);
  }
}