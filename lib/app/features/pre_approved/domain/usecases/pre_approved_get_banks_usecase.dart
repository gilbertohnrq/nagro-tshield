import 'package:finan/app/core/utils/use_case/i_usecase.dart';
import 'package:finan/app/features/pre_approved/domain/failures/pre_approved_failures.dart';
import 'package:finan/app/features/pre_approved/domain/repositories/i_pre_approved_repository.dart';
import 'package:finan/app/features/pre_approved/infra/models/banks_pre_approved.dart';
import 'package:result_dart/result_dart.dart';

class PreApprovedGetBanksUsecase implements IUsecase {
  final IPreApprovedRepository _repository;

  PreApprovedGetBanksUsecase({required IPreApprovedRepository repository})
      : _repository = repository;

  @override
  AsyncResult<List<BanksPreApprovedModel>, PreApprovedFailure> call(params) async {
    try {
      final res = _repository.getBanks();
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
