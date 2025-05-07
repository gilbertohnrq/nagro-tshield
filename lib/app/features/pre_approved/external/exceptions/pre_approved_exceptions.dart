// coverage:ignore-file

abstract class PreApprovedException implements Exception {}

class NotFoundException extends PreApprovedException {}

class ForbiddenException extends PreApprovedException {}

class InternalServerException extends PreApprovedException {}

class ServiceUnavailableException extends PreApprovedException {}

class InvalidDataException extends PreApprovedException {}
