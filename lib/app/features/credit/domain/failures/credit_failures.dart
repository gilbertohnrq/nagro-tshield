//coverage:ignore-file

abstract class CreditFailure {}

class NotAuthorized extends CreditFailure {
  @override
  String toString() => "Ocorreu um erro interno no servidor. Tente novamente mais tarde.";
}

class CreditNotFound extends CreditFailure {
  @override
  String toString() => "Não foi possível pedir crédito. Tente novamente mais tarde.";
}

class ServiceUnavailable extends CreditFailure {
  @override
  String toString() => "O serviço está temporariamente indisponível. Por favor, tente novamente mais tarde.";
}
