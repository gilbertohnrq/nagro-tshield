// coverage:ignore-file
abstract class BiometricExceptionsException implements Exception {}

class NotFoundException extends BiometricExceptionsException {}

class ForbiddenException extends BiometricExceptionsException {}

class InternalServerException extends BiometricExceptionsException {}

class ServiceUnavailableException extends BiometricExceptionsException {}

class InvalidDataException extends BiometricExceptionsException {}
