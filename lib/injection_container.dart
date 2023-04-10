import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:whats_app_clone_clean_architecture/presentation/bloc/auth/auth_cuibt.dart';
import 'package:whats_app_clone_clean_architecture/presentation/bloc/phone_auth/phone_auth_cuibt.dart';
import '../data/datasource/firebase_remote_datasource.dart';
import '../data/datasource/firebase_remote_datasource_impl.dart';
import '../data/repositories/firebase_repository_impl.dart';
import '../domain/repositories/firebase_repository.dart';
import '../domain/usecases/create_update_current_user_usecase.dart';
import '../domain/usecases/get_current_id_usecase.dart';
import '../domain/usecases/is_sign_in_usecase.dart';
import '../domain/usecases/sign_out_usecase.dart';
import '../domain/usecases/signin_with_phone_number_usecase.dart';
import '../domain/usecases/verify_phone_number_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //bloc
  sl.registerFactory<AuthCubit>(
    () => AuthCubit(
      isSignInUseCase: sl.call(),
      getCurrentUIdUseCase: sl.call(),
      signOutUseCase: sl.call(),
    ),
  );
  sl.registerFactory<PhoneAuthCubit>(
    () => PhoneAuthCubit(
      signInWithPhoneNumberUseCase: sl.call(),
      verifyPhoneNumberUseCase: sl.call(),
      createUpdateCurrentUserUseCase: sl.call(),
    ),
  );
  //useCases
  sl.registerLazySingleton<CreateUpdateCurrentUserUseCase>(
    () => CreateUpdateCurrentUserUseCase(
      repository: sl.call(),
    ),
  );
  sl.registerLazySingleton<GetCurrentUIdUseCase>(
    () => GetCurrentUIdUseCase(
      repository: sl.call(),
    ),
  );
  sl.registerLazySingleton<IsSignInUseCase>(
    () => IsSignInUseCase(
      repository: sl.call(),
    ),
  );
  sl.registerLazySingleton<SignOutUseCase>(
    () => SignOutUseCase(
      repository: sl.call(),
    ),
  );
  sl.registerLazySingleton<SignInWithPhoneNumberUseCase>(
    () => SignInWithPhoneNumberUseCase(
      repository: sl.call(),
    ),
  );
  sl.registerLazySingleton<VerifyPhoneNumberUseCase>(
    () => VerifyPhoneNumberUseCase(
      repository: sl.call(),
    ),
  );

  //repository
  sl.registerLazySingleton<FireBaseRepository>(
    () => FireBaseRepositoryIml(
      remoteDataSource: sl.call(),
    ),
  );

  //remote data
  sl.registerLazySingleton<FirebaseRemoteDataSource>(
    () => FirebaseRemoteDataSourceImpl(
      auth: sl.call(),
      fireStore: sl.call(),
    ),
  );

  // External
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  sl.registerLazySingleton(
    () => auth,
  );
  sl.registerLazySingleton(
    () => fireStore,
  );
}
