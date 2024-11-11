import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
part 'sign_in_with_google_state.dart';

class SignInWithGoogleCubit extends Cubit<SignInWithGoogleState> {
  SignInWithGoogleCubit() : super(SignInWithGoogleInitial());

  Future<User?> signInWithGoogle() async {
    try {
      emit(SignInWithGoogleLoadingState());
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // The user canceled the sign-in

        emit(SignInWithGoogleFailureState(
            errorMessage: "Sign-In aborted by user"));
        return null;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google user credential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      emit(SignInWithGoogleSuccessState());
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // Handle Firebase-specific errors
      switch (e.code) {
        case 'account-exists-with-different-credential':
          emit(SignInWithGoogleFailureState(
              errorMessage: "Account exists with a different credential."));
          // Prompt user to use the linked provider
          break;
        case 'invalid-credential':
          emit(SignInWithGoogleFailureState(
              errorMessage: "Invalid credential."));
          break;
        case 'user-disabled':
          emit(SignInWithGoogleFailureState(
              errorMessage: "User account has been disabled."));
          break;
        case 'operation-not-allowed':
          emit(SignInWithGoogleFailureState(
              errorMessage: "Operation not allowed."));
          break;
        case 'user-not-found':
          emit(SignInWithGoogleFailureState(errorMessage: "User not found."));
          break;
        case 'wrong-password':
          emit(SignInWithGoogleFailureState(
              errorMessage: "Incorrect password."));
          break;
        default:
          emit(SignInWithGoogleFailureState(
              errorMessage: "An unknown error occurred.${e.message}"));
      }
    } catch (e) {
      // Handle generic errors
      emit(SignInWithGoogleFailureState(errorMessage: "An error occurred: $e"));
    }
    return null;
  }

Future<void> signOutGoogle() async {
      final GoogleSignIn _googleSignIn = GoogleSignIn();
  try {

    await _googleSignIn.signOut();
    emit(SignOutWithGoogleSuccessState());
  } catch (error) {
    emit(SignInWithGoogleFailureState(errorMessage: error.toString()));
  }
}
}