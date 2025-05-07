// coverage:ignore-file
import 'package:finan/app/features/credit/domain/failures/credit_failures.dart';
import 'package:finan/app/features/credit/domain/repositories/i_credit_repository.dart';
import 'package:finan/app/features/credit/external/exceptions/credit_exceptions.dart';
import 'package:finan/app/features/credit/external/i_credit_service.dart';
import 'package:finan/app/features/credit/infra/models/credit_request/credit_request.dart';
import 'package:finan/app/features/credit/infra/models/credit_response/credit_response.dart';
import 'package:finan/app/features/credit/infra/models/credit_validate_response/credit_validate_response.dart';
import 'package:result_dart/result_dart.dart';

class CreditRepositoryImpl extends ICreditRepository {
  final ICreditService _creditService;

  CreditRepositoryImpl({required ICreditService creditService})
      : _creditService = creditService;

  @override
  AsyncResult<CreditValidateResponse, CreditFailure> getCreditValidate() async {
    try {
      final CreditValidateResponse response =
          await _creditService.getCreditValidate();
      return Success(response);
    } on NotFoundException {
      return Failure(CreditNotFound());
    } on InternalServerException {
      return Failure(NotAuthorized());
    }
  }

  @override
  AsyncResult<CreditResponse, CreditFailure> getScrTerms() async {
    try {
      final CreditResponse response = await _creditService.getScrTerms();
      return Success(response);
    } on NotFoundException {
      return Failure(CreditNotFound());
    } on InternalServerException {
      return Failure(NotAuthorized());
    }
  }

  @override
  AsyncResult<CreditResponse, CreditFailure> sendCreditRequest(
      CreditRequest request) async {
    try {
      final CreditResponse response =
          await _creditService.sendCreditRequest(request);
      return Success(response);
    } on NotFoundException {
      return Failure(CreditNotFound());
    } on InternalServerException {
      return Failure(NotAuthorized());
    } on ServiceUnavailableException {
      return Failure(ServiceUnavailable());
    }
  }
}
