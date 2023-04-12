part of 'user_authentication_bloc.dart';

abstract class UserAuthenticationEvent extends Equatable {
  const UserAuthenticationEvent();

  @override
  List<Object> get props => [];
}

class UserAuthenticationInitialEvent extends UserAuthenticationEvent {
  @override
  List<Object> get props => [];
}

class LoginEvent extends UserAuthenticationEvent {
  String phoneNumber;

  LoginEvent({required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}

class LoginViaSignUpEvent extends UserAuthenticationEvent {
  String phoneNumber;

  LoginViaSignUpEvent({required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}

class SendOTP extends UserAuthenticationEvent {
  String otp;

  SendOTP({required this.otp});

  @override
  List<Object> get props => [otp];
}

class OnPhoneAuthVerificationCompleteEvent extends UserAuthenticationEvent {
  final AuthCredential credential;
  const OnPhoneAuthVerificationCompleteEvent({
    required this.credential,
  });
}

class OnPhoneOtpSent extends UserAuthenticationEvent {
  final String verificationId;
  final int? token;
  const OnPhoneOtpSent({
    required this.verificationId,
    required this.token,
  });
}

class OnPhoneAuthErrorEvent extends UserAuthenticationEvent {
  final String error;
  const OnPhoneAuthErrorEvent({required this.error});

  @override
  List<Object> get props => [error];
}

class LogoutEvent extends UserAuthenticationEvent {}

class CheckAuthenticationEvent extends UserAuthenticationEvent {}
