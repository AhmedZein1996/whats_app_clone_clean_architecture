import '../../domain/entites/user_entity.dart';
import '../../domain/repositories/firebase_repository.dart';

class CreateUpdateCurrentUserUseCase {
  final FireBaseRepository repository;

  CreateUpdateCurrentUserUseCase({required this.repository});

  Future<void> call(UserEntity user) async {
     await repository.createUpdateCurrentUser(user);
  }
}
