// coverage:ignore-file
import 'package:finan/app/core/utils/use_case/i_usecase.dart';
import 'package:finan/app/features/pre_approved/domain/failures/cep_failures.dart';
import 'package:finan/app/features/pre_approved/domain/repositories/i_cep_repository.dart';
import 'package:finan/app/features/pre_approved/infra/models/get_address/get_address_response.dart';
import 'package:result_dart/result_dart.dart';

class GetAddressUsecase implements IUsecase {
  final ICepRepository _repository;

  GetAddressUsecase({required ICepRepository repository})
      : _repository = repository;

  @override
  AsyncResult<GetAddressResponse, CepFailure> call(params) async {
    try {
      final res = _repository.getAddress(params);
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
