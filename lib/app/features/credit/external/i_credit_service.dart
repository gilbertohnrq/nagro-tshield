// coverage:ignore-file
//coverage:ignore-file

import 'package:finan/app/features/credit/infra/models/credit_request/credit_request.dart';
import 'package:finan/app/features/credit/infra/models/credit_response/credit_response.dart';
import 'package:finan/app/features/credit/infra/models/credit_validate_response/credit_validate_response.dart';

abstract class ICreditService {
  Future<CreditResponse> sendCreditRequest(CreditRequest request);
  Future<CreditResponse> getScrTerms();
  Future<CreditValidateResponse> getCreditValidate();
}
