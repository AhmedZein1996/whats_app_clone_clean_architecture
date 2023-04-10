import 'package:equatable/equatable.dart';

abstract class PhoneAuthState extends Equatable{

}

class PhoneAuthInitial extends PhoneAuthState{
  @override

  List<Object?> get props => [];

}class PhoneAuthLoading extends PhoneAuthState{
  @override

  List<Object?> get props => [];

}

class PhoneAuthSmsCodeReceived extends PhoneAuthState {
  @override
  List<Object?> get props => [];

}class PhoneAuthProfileInfo extends PhoneAuthState {
  @override
  List<Object?> get props => [];

}class PhoneAuthSuccess extends PhoneAuthState {
  @override
  List<Object?> get props => [];

}class PhoneAuthFailure extends PhoneAuthState {
  @override
  List<Object?> get props => [];

}