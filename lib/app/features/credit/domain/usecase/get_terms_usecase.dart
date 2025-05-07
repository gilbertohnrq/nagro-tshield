// coverage:ignore-file
import 'package:finan/app/core/utils/use_case/i_usecase.dart';
import 'package:finan/app/features/credit/domain/failures/credit_failures.dart';
import 'package:finan/app/features/credit/domain/repositories/i_credit_repository.dart';
import 'package:finan/app/features/credit/infra/models/credit_response/credit_response.dart';
import 'package:result_dart/result_dart.dart';

class GetTermsUseCase implements IUsecase {
  final ICreditRepository _repository;

  GetTermsUseCase({required ICreditRepository repository})
      : _repository = repository;

  @override
  AsyncResult<CreditResponse, CreditFailure> call(params) async {
    try {
      final res = _repository.getScrTerms();
      return res;
    } catch (e) {
      rethrow;
    }
  }

}
