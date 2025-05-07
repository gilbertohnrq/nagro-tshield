// coverage:ignore-file

abstract class CepException implements Exception {}

class NotFoundException extends CepException {}

class ForbiddenException extends CepException {}

class InternalServerException extends CepException {}

class ServiceUnavailableException extends CepException {}

class InvalidDataException extends CepException {}
