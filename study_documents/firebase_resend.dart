// import 'package:firebase_auth/firebase_auth.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;

// // Replace `phoneNumber` with the user's phone number.
// void verifyPhoneNumber(String phoneNumber) async {
//   await _auth.verifyPhoneNumber(
//     phoneNumber: phoneNumber,
//     timeout: Duration(seconds: 60), // Timeout for code verification.
//     verificationCompleted: (AuthCredential credential) {
//       // This callback will be triggered if the verification is completed automatically.
//       // You can use this to sign in the user automatically.
//     },
//     verificationFailed: (FirebaseAuthException e) {
//       // This callback will be triggered if the verification fails.
//       // You can handle the error here.
//     },
//     codeSent: (String verificationId, int? resendToken) {
//       // This callback will be triggered when the SMS code is sent to the user's phone number.
//       // Save the `verificationId` and `resendToken` values for later use.
//     },
//     codeAutoRetrievalTimeout: (String verificationId) {
//       // This callback will be triggered when the auto-retrieval of the SMS code times out.
//       // You can handle the error here.
//     },
//   );
// }

// // Call this method to resend the SMS code.
// void resendVerificationCode(String phoneNumber, int? resendToken) async {
//   await _auth.verifyPhoneNumber(
//     phoneNumber: phoneNumber,
//     timeout: Duration(seconds: 60),
//     forceResendingToken: resendToken, // Pass the `resendToken` value here.
//     codeSent: (String verificationId, int? newResendToken) {
//       // This callback will be triggered when the new SMS code is sent to the user's phone number.
//       // Save the `verificationId` and `newResendToken` values for later use.
//     },
//   );
// }
