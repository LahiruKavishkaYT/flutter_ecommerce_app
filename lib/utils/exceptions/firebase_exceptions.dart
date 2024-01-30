class TFirebaseException implements Exception {
  final String code;

  TFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'unknown':
        return 'unknown firebase error occurred.';
      case 'invalid-custom-token':
        return '1.';
      case 'weak-password':
        return 'Password is too weak. choose a strong password.';
      case 'user-disabled':
        return '2';
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
