import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_authentication/authentication_bloc/auth_repository.dart';

import 'package:mobile_authentication/database/database.dart';
import 'package:mobile_authentication/models/user.dart';
part 'user_authentication_event.dart';
part 'user_authentication_state.dart';

class UserAuthenticationBloc
    extends Bloc<UserAuthenticationEvent, UserAuthenticationState> {
  final PhoneAuthRepository_ phoneAuthRepo;
  final auth = FirebaseAuth.instance;
  var vid = "";
  Database db = Database();

  UserAuthenticationBloc({required this.phoneAuthRepo})
      : super(UserAuthenticationInitialState()) {
    on<LoginEvent>(_onSendOtp);
    // After receiving the otp, When user clicks on verify otp button then this event will be fired
    on<SendOTP>(_onVerifyOtp);
    on<OnPhoneAuthErrorEvent>(
        (event, emit) => emit(PhoneAuthError(error: event.error)));

    on<OnPhoneOtpSent>((event, emit) =>
        emit(PhoneAuthCodeSentSuccess(verificationId: event.verificationId)));

    // When the otp verification is successful, this event will be fired
    on<OnPhoneAuthVerificationCompleteEvent>(_loginWithCredential);

    on<LogoutEvent>(_logout);

    on<CheckAuthenticationEvent>(_checkAuthentication);
  }

  Future<void> _onSendOtp(
      LoginEvent event, Emitter<UserAuthenticationState> emit) async {
    emit(PhoneLoadingState());
    String phone = event.phoneNumber;
    try {
      await phoneAuthRepo.verifyPhone(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // On [verificationComplete], we will get the credential from the firebase  and will send it to the [OnPhoneAuthVerificationCompleteEvent] event to be handled by the bloc and then will emit the [PhoneAuthVerified] state after successful login
          add(OnPhoneAuthVerificationCompleteEvent(credential: credential));
        },
        codeSent: (String verificationId, int? resendToken) {
          vid = verificationId;
          // On [codeSent], we will get the verificationId and the resendToken from the firebase and will send it to the [OnPhoneOtpSent] event to be handled by the bloc and then will emit the [OnPhoneAuthVerificationCompleteEvent] event after receiving the code from the user's phone
          add(OnPhoneOtpSent(
              verificationId: verificationId, token: resendToken));
        },
        verificationFailed: (FirebaseAuthException e) {
          // On [verificationFailed], we will get the exception from the firebase and will send it to the [OnPhoneAuthErrorEvent] event to be handled by the bloc and then will emit the [PhoneAuthError] state in order to display the error to the user's screen
          add(OnPhoneAuthErrorEvent(error: e.code));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (error) {
      emit(
        PhoneAuthError(
          error: error.toString(),
        ),
      );
    }
  }

  Future<void> _onVerifyOtp(
      SendOTP event, Emitter<UserAuthenticationState> emit) async {
    emit(PhoneLoadingState());
    try {
      // After receiving the otp, we will verify the otp and then will create a credential from the otp and verificationId and then will send it to the [OnPhoneAuthVerificationCompleteEvent] event to be handled by the bloc and then will emit the [PhoneAuthVerified] state after successful login
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: vid,
        smsCode: event.otp,
      );
      add(OnPhoneAuthVerificationCompleteEvent(credential: credential));
    } catch (e) {
      emit(PhoneAuthError(error: e.toString()));
    }
  }

  Future<void> _loginWithCredential(OnPhoneAuthVerificationCompleteEvent event,
      Emitter<UserAuthenticationState> emit) async {
    // After receiving the credential from the event, we will login with the credential and then will emit the [PhoneAuthVerified] state after successful login

    try {
      final HttpsCallable checkPhoneNumberExistence =
          FirebaseFunctions.instance.httpsCallable('checkPhoneNumberExistence');
      final result =
          await checkPhoneNumberExistence({'phoneNumber': '+917992482690'});
      if (result.data['exists']) {
        print('Phone number already exists in Firebase Auth');
        await auth.signInWithCredential(event.credential).then((user) {
          if (user.user != null) {
            emit(PhoneAuthVerified(
                currentUser: user.user,
                displayName: user.user?.displayName,
                isLoggedIn: true));
          } else {
            return;
          }
        });
      } else {
        await auth.signInWithCredential(event.credential).then((user) async {
          if (user.user != null) {
            AppUser appUser = AppUser();
            Database db = Database();
            String? phoneNumber = auth.currentUser?.phoneNumber;
            appUser.phone = phoneNumber;
            appUser.userUID = auth.currentUser?.uid;

            bool result = await db.addWithDocId(appUser);
            if (!result) {
              // ignore: prefer_const_constructors
              emit(PhoneAuthError(
                  error: "Some thing went wrong in adding data to user "));
              return;
            }
            emit(PhoneAuthVerified(
                currentUser: user.user,
                displayName: user.user?.displayName,
                isLoggedIn: true));
          }
        });
      }
    } on FirebaseFunctionsException catch (e) {
      print(e);
      emit(PhoneAuthError(error: e.code));
    } on FirebaseAuthException catch (e) {
      print(e);
      emit(PhoneAuthError(error: e.code));
    } catch (e) {
      emit(PhoneAuthError(error: e.toString()));
    }
  }

  Future<void> _logout(
      LogoutEvent event, Emitter<UserAuthenticationState> emit) async {
    PhoneLoadingState();
    try {
      await auth.signOut();
    } catch (error) {
      print(error);
    }

    emit(LogOutState());
  }

  Future<void> _checkAuthentication(CheckAuthenticationEvent event,
      Emitter<UserAuthenticationState> emit) async {
    User? user = auth.currentUser;
    if (user != null) {
      emit(PhoneAuthVerified());
    } else {
      emit(LogOutState());
    }
  }
}
