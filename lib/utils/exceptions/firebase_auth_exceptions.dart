class TFirebaseAuthException implements Exception {
  final String code;

  TFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'This Email is already registered, use a differant email.';
      case 'invalid-email':
        return 'Please enter a valid Email.';
      case 'weak-password':
        return 'Password is too weak. choose a strong password.';
      case 'user-disabled':
        return 'This account has been disabled.Please contact us';
      case 'user-not-found':
        return 'Invalid login details. User not found';
      case 'wrong-password':
        return 'Incorrect Password, check your password & try again.';
      case 'Invalid-verification-code':
        return 'Incorrect verification code, please request new verification code.';
      case 'Invalid-verification-id':
        return 'Incorrect verification id, please request new verification code.';
      case 'quota-exceeded':
        return 'This email already exist. use a differant email.';
      case 'email-already-exceeded':
        return 'This email already exist. use a differant email.';
      case 'provider-already-linked':
        return 'This account is already linked to another provider.';
      default:
        return 'Something went wrong';
    }
  }
}
