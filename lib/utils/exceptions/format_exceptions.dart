class TFormatException implements Exception {
  final String message;

  const TFormatException(
      [this.message =
          'An unexpected error occurred. please check your inputs.']);

  factory TFormatException.fromMessage(String message) {
    return TFormatException(message);
  }

  String get formattedMessage => message;

  factory TFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const TFormatException('The  email address format is invalid');

      case 'invalid-phone-number-format':
        return const TFormatException('The  phone number format is invalid');

      case 'invalid-date-format':
        return const TFormatException('The date format is invalid');

      case 'invalid-url-format':
        return const TFormatException('The url format is invalid');

      case 'invalid-credit-card-format':
        return const TFormatException('The credit card format is invalid');

      case 'invalid-numeric-format':
        return const TFormatException(
            'The input should be valid numeric format.');

      default:
        return const TFormatException('Something went wrong');
    }
  }
}
