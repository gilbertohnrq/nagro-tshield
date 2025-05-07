import 'package:finan/app/core/utils/use_case/i_usecase.dart';
import 'package:finan/app/features/pre_approved/domain/failures/pre_approved_failures.dart';
import 'package:finan/app/features/pre_approved/domain/repositories/i_pre_approved_repository.dart';
import 'package:finan/app/features/pre_approved/infra/models/from_simulate.dart';
import 'package:result_dart/result_dart.dart';

class PreApprovedSimulateUsecase implements IUsecase {
  final IPreApprovedRepository _repository;

  PreApprovedSimulateUsecase({required IPreApprovedRepository repository})
      : _repository = repository;

  @override
  AsyncResult<FromSimulate, PreApprovedFailure> call(params) async {
    try {
      final res = _repository.simulate(params);
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
