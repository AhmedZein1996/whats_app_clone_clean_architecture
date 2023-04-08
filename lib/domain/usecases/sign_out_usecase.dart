import '../repositories/firebase_repository.dart';

class SignOutUseCase {
  final FireBaseRepository repository;

  SignOutUseCase({required this.repository});

  Future<void> call() async {
     await repository.signOut();
  }
}
