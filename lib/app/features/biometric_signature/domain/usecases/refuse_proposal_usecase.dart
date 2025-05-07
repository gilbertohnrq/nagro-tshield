import 'package:finan/app/core/utils/use_case/i_usecase.dart';
import 'package:finan/app/features/biometric_signature/domain/failures/biometric_signature_failures.dart';
import 'package:finan/app/features/biometric_signature/domain/repositories/i_biometric_signature_repository.dart';
import 'package:finan/app/features/biometric_signature/infra/models/refuse_response.dart';
import 'package:result_dart/result_dart.dart';

class RefuseProposalUseCase implements IUsecase {
  final IBiometricSignatureRepository _repository;

  RefuseProposalUseCase({required IBiometricSignatureRepository repository})
      : _repository = repository;

  @override
  AsyncResult<RefuseResponse, BiometricSignatureFailure> call(params) async {
    try {
      final res = _repository.refuse(params);
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
