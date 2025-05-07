import 'package:finan/app/core/utils/use_case/i_usecase.dart';
import 'package:finan/app/features/pre_approved/domain/failures/pre_approved_failures.dart';
import 'package:finan/app/features/pre_approved/domain/repositories/i_pre_approved_repository.dart';
import 'package:result_dart/result_dart.dart';

class PreApprovedUpdateClientUsecase implements IUsecase {
  final IPreApprovedRepository _repository;

  PreApprovedUpdateClientUsecase({required IPreApprovedRepository repository})
      : _repository = repository;

  @override
  AsyncResult<bool, PreApprovedFailure> call(params) async {
    try {
      final response = await _repository.updateClient(params);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
