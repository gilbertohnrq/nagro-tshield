import 'package:dio/dio.dart';
import 'package:finan/app/features/credit/external/exceptions/credit_exceptions.dart';
import 'package:finan/app/features/credit/external/i_credit_service.dart';
import 'package:finan/app/features/credit/infra/models/credit_request/credit_request.dart';
import 'package:finan/app/features/credit/infra/models/credit_response/credit_response.dart';
import 'package:finan/app/features/credit/infra/models/credit_validate_response/credit_validate_response.dart';

class CreditService extends ICreditService {
  CreditService();

  Map<int, CreditException> exceptions = {
    404: NotFoundException(),
    500: InternalServerException(),
    403: ForbiddenException(),
    503: ServiceUnavailableException()
  };

  @override
  Future<CreditResponse> sendCreditRequest(CreditRequest request) async {
    try {
      return CreditResponse.mocked();
    } on DioException catch (dioException) {
      if (exceptions.containsKey(dioException.response?.statusCode)) {
        throw exceptions[dioException.response?.statusCode]!;
      } else {
        throw NotFoundException();
      }
    }
  }

  @override
  Future<CreditResponse> getScrTerms() async {
    try {
      return CreditResponse.mocked();
    } on DioException catch (dioException) {
      if (exceptions.containsKey(dioException.response?.statusCode)) {
        throw exceptions[dioException.response?.statusCode]!;
      } else {
        throw NotFoundException();
      }
    }
  }

  @override
  Future<CreditValidateResponse> getCreditValidate() async {
    try {
      return CreditValidateResponse.mocked();
    } on DioException catch (dioException) {
      if (exceptions.containsKey(dioException.response?.statusCode)) {
        throw exceptions[dioException.response?.statusCode]!;
      } else {
        throw NotFoundException();
      }
    }
  }
}
