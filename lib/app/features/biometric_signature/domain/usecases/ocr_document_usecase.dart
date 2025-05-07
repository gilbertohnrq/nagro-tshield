import 'package:finan/app/core/utils/use_case/i_usecase.dart';
import 'package:finan/app/features/biometric_signature/domain/failures/biometric_signature_failures.dart';
import 'package:finan/app/features/biometric_signature/domain/repositories/i_biometric_signature_repository.dart';
import 'package:finan/app/features/biometric_signature/infra/models/ocr_document_response.dart';
import 'package:result_dart/result_dart.dart';

class OcrDocumentUsecase implements IUsecase {
  final IBiometricSignatureRepository _repository;

  OcrDocumentUsecase({required IBiometricSignatureRepository repository})
      : _repository = repository;

  @override
  AsyncResult<OcrDocumentResponse, BiometricSignatureFailure> call(params) async {
    try {
      final res = _repository.ocrDocument(params);
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
