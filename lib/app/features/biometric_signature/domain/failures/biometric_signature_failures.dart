//coverage:ignore-file

abstract class BiometricSignatureFailure {}

class NotAuthorized extends BiometricSignatureFailure {
  @override
  String toString() =>
      "Ocorreu um erro interno no servidor. Tente novamente mais tarde.";
}

class BiometricSignatureNotFound extends BiometricSignatureFailure {
  @override
  String toString() =>
      "Não foi possível encontrar. Tente novamente mais tarde.";
}

class InvalidData extends BiometricSignatureFailure {
  @override
  String toString() =>
      "Os dados recebidos são inválidos. Tente novamente mais tarde.";
}
