import '../repositories/firebase_repository.dart';

class GetCurrentUIdUseCase {
  final FireBaseRepository repository;

  GetCurrentUIdUseCase({required this.repository});

  Future<String> call() async {
    return await repository.getCurrentUId();
  }
}
