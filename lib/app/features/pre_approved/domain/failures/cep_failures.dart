// coverage:ignore-file
abstract class CepFailure {}

class NotAuthorized extends CepFailure {
  @override
  String toString() =>
      "Ocorreu um erro interno no servidor. Tente novamente mais tarde.";
}

class CepNotFound extends CepFailure {
  @override
  String toString() => "CEP Não encontrado. Tente novamente";
}

class InvalidData extends CepFailure {
  @override
  String toString() => "Os dados recebidos são inválidos. Tente novamente.";
}
