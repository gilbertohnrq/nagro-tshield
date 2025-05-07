// coverage:ignore-file
abstract class PreApprovedFailure {}

class NotAuthorized extends PreApprovedFailure {
  @override
  String toString() =>
      "Ocorreu um erro interno no servidor. Tente novamente mais tarde.";
}

class PreApprovedNotFound extends PreApprovedFailure {
  @override
  String toString() =>
      "Não foi possível encontrar. Tente novamente mais tarde.";
}

class InvalidData extends PreApprovedFailure {
  @override
  String toString() =>
      "Os dados recebidos são inválidos. Tente novamente mais tarde.";
}
