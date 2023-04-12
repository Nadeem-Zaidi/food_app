part of 'user_authentication_bloc.dart';

abstract class UserAuthenticationState extends Equatable {
  const UserAuthenticationState();

  @override
  List<Object> get props => [];
}

class UserAuthenticationInitialState extends UserAuthenticationState {}

class PhoneLoadingState extends UserAuthenticationState {}

class GoToOTPScreenState extends UserAuthenticationState {
  @override
  List<Object> get props => [];
}

class GoToUserSetUpScreen extends UserAuthenticationState {
  @override
  List<Object> get props => [];
}

class PhoneAuthError extends UserAuthenticationState {
  final String error;

  const PhoneAuthError({required this.error});

  @override
  List<Object> get props => [error];
}

class PhoneAuthVerified extends UserAuthenticationState {
  User? currentUser;
  String? displayName;
  bool? isLoggedIn;
  PhoneAuthVerified({this.currentUser, this.displayName, this.isLoggedIn});
}

class PhoneAuthCodeSentSuccess extends UserAuthenticationState {
  final String verificationId;
  const PhoneAuthCodeSentSuccess({
    required this.verificationId,
  });
  @override
  List<Object> get props => [verificationId];
}

class LogOutState extends UserAuthenticationState {}

class GoToOTPScreen extends UserAuthenticationState {}
