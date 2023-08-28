class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);
  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error during Communication');
}

// class UnprocessableEntityException implements Exception {
//   final String message;

//   UnprocessableEntityException(this.message);

//   @override
//   String toString() {
//     return 'UnprocessableEntityException: $message';
//   }
// }
class UnprocessableEntityException extends AppException {
  UnprocessableEntityException([String? message])
      : super(message, 'Invalid request!! ');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid request');
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message])
      : super(message, 'Unauthorized request');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}

class IncorrectCredentialsException extends AppException {
  IncorrectCredentialsException([String? message])
      : super(message, 'Invalid Input');
}
