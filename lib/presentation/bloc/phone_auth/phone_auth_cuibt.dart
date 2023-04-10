import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app_clone_clean_architecture/domain/entites/user_entity.dart';
import '../../../domain/usecases/create_update_current_user_usecase.dart';
import '../../../domain/usecases/signin_with_phone_number_usecase.dart';
import '../../../domain/usecases/verify_phone_number_usecase.dart';
import '../../../presentation/bloc/phone_auth/phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  final SignInWithPhoneNumberUseCase signInWithPhoneNumberUseCase;
  final VerifyPhoneNumberUseCase verifyPhoneNumberUseCase;
  final CreateUpdateCurrentUserUseCase createUpdateCurrentUserUseCase;

  PhoneAuthCubit({
    required this.signInWithPhoneNumberUseCase,
    required this.verifyPhoneNumberUseCase,
    required this.createUpdateCurrentUserUseCase,
  }) : super(PhoneAuthInitial());

  Future<void> submitVerifyPhoneNumber(String phoneNumber) async {
    emit(PhoneAuthLoading());
    try {
      await verifyPhoneNumberUseCase.call(phoneNumber);
      emit(PhoneAuthSmsCodeReceived());
    } on SocketException catch (_) {
      emit(PhoneAuthFailure());
    } catch (_) {
      emit(PhoneAuthFailure());
    }
  }

  Future<void> submitSmsCode(String smsCode) async {
    emit(PhoneAuthLoading());
    try {
      await signInWithPhoneNumberUseCase.call(smsCode);
      emit(PhoneAuthProfileInfo());
    } on SocketException catch (_) {
      emit(PhoneAuthFailure());
    } catch (_) {
      emit(PhoneAuthFailure());
    }
  }

  Future<void> submitProfileInfo({
   required String name,
   required String profileUrl,
   required String phoneNumber,
  }) async {
    try {
      await createUpdateCurrentUserUseCase.call(
        UserEntity(
          name: name,
          email: '',
          phoneNumber: phoneNumber,
          uid: '',
          status: '',
          profileUrl: profileUrl,
          isOnline: true,
        ),
      );
      emit(PhoneAuthSuccess());
    } on SocketException catch (_) {
      emit(PhoneAuthFailure());
    } catch (_) {
      emit(PhoneAuthFailure());
    }
  }
}
