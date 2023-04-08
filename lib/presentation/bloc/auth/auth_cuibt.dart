import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_current_id_usecase.dart';
import '../../../domain/usecases/is_sign_in_usecase.dart';
import '../../../domain/usecases/sign_out_usecase.dart';
import '../../../presentation/bloc/auth/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IsSignInUseCase isSignInUseCase;
  final GetCurrentUIdUseCase getCurrentUIdUseCase;
  final SignOutUseCase signOutUseCase;

  AuthCubit({
    required this.isSignInUseCase,
    required this.getCurrentUIdUseCase,
    required this.signOutUseCase,
  }) : super(AuthInitial());

  Future<void> appStarted() async {
    try {
      bool isSignIn = await isSignInUseCase.call();
      log('user is signIn :$isSignIn');
      if (isSignIn) {
        final uid = await getCurrentUIdUseCase.call();
        emit(Authenticated(uid: uid));
      } else {
        emit(UnAuthenticated());
      }
    } catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedIn() async {
    try {
      final uid = await getCurrentUIdUseCase.call();
      emit(Authenticated(uid: uid));
    } catch (_) {}
  }

  Future<void> loggedOut() async {
    try {
      await signOutUseCase.call();
      emit(UnAuthenticated());
    } catch (_) {}
  }
}
