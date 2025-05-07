// coverage:ignore-file
//coverage:ignore-file

abstract class CreditException implements Exception {}

class NotFoundException extends CreditException {}

class ForbiddenException extends CreditException {}

class InternalServerException extends CreditException {}

class ServiceUnavailableException extends CreditException {}
