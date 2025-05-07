// coverage:ignore-file
//coverage:ignore-file

import 'package:finan/app/features/credit/domain/failures/credit_failures.dart';
import 'package:finan/app/features/credit/infra/models/credit_request/credit_request.dart';
import 'package:finan/app/features/credit/infra/models/credit_response/credit_response.dart';
import 'package:finan/app/features/credit/infra/models/credit_validate_response/credit_validate_response.dart';
import 'package:result_dart/result_dart.dart';

abstract class ICreditRepository {
  AsyncResult<CreditResponse, CreditFailure> sendCreditRequest(CreditRequest request);
  AsyncResult<CreditResponse, CreditFailure> getScrTerms();
  AsyncResult<CreditValidateResponse, CreditFailure> getCreditValidate();
}
